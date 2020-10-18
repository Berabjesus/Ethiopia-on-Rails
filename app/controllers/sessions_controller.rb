class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def oauth
    # redirect_to sessions_path
   @auth= request.env['omniauth.auth']
  end
end
