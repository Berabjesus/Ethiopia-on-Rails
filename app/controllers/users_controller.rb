class UsersController < ApplicationController
  before_action :create_categories
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.valid? && @user.save
      create_session @user.id
      redirect_to articles_path, notice: "Hi #{@user.name}, you have signed up successfully!"
    else
      errors = '<div class= "border-bottom pb-3">Sign up Error</div>'
      errors << custom_errors(@user.errors)
      respond_to do |format|
        format.html { redirect_to articles_path, alert: errors.html_safe }
      end
    end
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
