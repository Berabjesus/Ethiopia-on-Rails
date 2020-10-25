class ApplicationController < ActionController::Base
  require 'open-uri'
  helper_method :current_user, :logged_in?, :weather_info, :top_voted_article, :priority_categories, :top_of_category

  private 

  def current_user
    User.find_by(id: session[session_name]) unless session[session_name].nil?
  end

  def access_control
    redirect_to articles_path, alert: 'You are not logged in' unless session_exists? && current_user
  end

  def logged_in?
    session_exists? && current_user ? true : false
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

  def custom_errors(errors)
    errors.full_messages.join(', ').gsub(",", "<br>")
  end

  def weather_info
    api_key = Rails.application.credentials.weatherapi[:weatherapi_id]
    icon = "//cdn.weatherapi.com/weather/64x64/day/116.png"
    # @json = JSON.load(open("http://api.weatherapi.com/v1/current.json?key=#{api_key}&q=addis ababa"))
        # @json = JSON.load(open("http://api.weatherstack.com/current?access_key=d5bebbfbe9b87a5cc02ce0295e5539ab&query=New%20York"))

  end

  def top_voted_article
    Article.order(vote_count: :desc).limit(1).first
  end

  def top_of_category category
    Category.find(category.id).articles.order(vote_count: :desc).limit(1).first
  end

  def priority_categories
    Category.all.order(priority: :desc).limit(4)
  end
end
