class ApplicationController < ActionController::Base
  require 'open-uri'

  helper_method :current_user, :weather_info

  def current_user
    User.find_by(id: session[session_name]) unless session[session_name].nil?
  end 

  def logged_in?
    redirect_to new_user_path, alert: 'You are not logged in' unless session_exists? 
  end

  def session_exists?
    session[session_name].present?
  end

  def create_session(user_id)
    session[session_name] = user_id
  end

  def session_name
    return :ethiopia_on_rails_session
  end

  def custom_errors(user_errors)
    user_errors.full_messages.join(', ').gsub(",", "<br>")
  end

  def weather_info
    api_key = Rails.application.credentials.weatherapi[:weatherapi_id]
    @json = JSON.load(open("http://api.weatherapi.com/v1/current.json?key=#{api_key}&q=addis ababa"))
  end
end
