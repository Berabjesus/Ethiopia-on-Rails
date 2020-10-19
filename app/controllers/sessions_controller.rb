class SessionsController < ApplicationController
  def new
    @session = User.new
  end
  def create
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      create_session @user.id
      redirect_to articles_path, alert: "Hi #{@user.name}"
    else
      render 'new'
    end
  end

  def destroy
    
  end

  def oauth
    user = User.find_or_create_by(oauthid: oauth_params['uid'], provider: oauth_params['provider']) do |u|
      u.name = oauth_params['info']['name']
      u.password = SecureRandom.hex(16)
    end
    if user.valid?
      create_session user.id
      redirect_to articles_path
    else
      errors = '<div class= "border-bottom pb-3">Authentication Error!/div> <br>'
      errors << custom_errors(@user.errors)
      errors << "<br> Please signup / login using your username and password if this persists"
      respond_to do |format|
        format.html { redirect_to new_user_path, alert: errors.html_safe }
      end
    end
  end

  private

  def oauth_params
    request.env['omniauth.auth']
  end

  def session_params
    params.permit(:name, :password, :password_confirmation)
  end
end
