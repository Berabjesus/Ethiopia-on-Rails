class SessionsController < ApplicationController
  def create
    
  end

  def destroy
    
  end

  def oauth
    # redirect_to sessions_path
   @auth= request.env['omniauth.auth']
  end
end
