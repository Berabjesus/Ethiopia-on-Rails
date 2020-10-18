class SessionsController < ApplicationController
  def create
    
  end

  def destroy
    
  end

  def oauth
    # redirect_to sessions_path
    user = User.find_or_create_by(oauthid: oauth_params['uid'], provider: oauth_params['provider']) do |u|
      u.name = oauth_params['info']['name']
      u.password = SecureRandom.hex(16)
    end

    if user.valid?
      # @auth= user
      session[session_name] = user.id
      redirect_to articles_path
    end
  end

  private

  def oauth_params
    request.env['omniauth.auth']
  end
end
