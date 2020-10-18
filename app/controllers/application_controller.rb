class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    User.find_by(id: session[session_name]) unless session[session_name].nil?
  end 

  def logged_in?
    redirect_to new_user_path, alert: 'You are not logged in' unless session_exists? 
  end

  def session_exists?
    session[session_name].present?
  end

  def session_name
    return :ethiopia_on_rails_session
  end
end
