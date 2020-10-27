class ApplicationController < ActionController::Base
  require 'open-uri'
  require 'json'

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
    :ethiopia_on_rails_session
  end

  def custom_errors(errors)
    errors.full_messages.join(', ').gsub(',', '<br>')
  end

  # rubocop:disable Metrics/MethodLength:
  def weather_info
    api_key = Rails.application.credentials.weatherapi[:weatherapi_id]
    url = "http://api.weatherapi.com/v1/current.json?key=#{api_key}&q=addis ababa"

    openuri_params = {
      open_timeout: 1,
      read_timeout: 1
    }
    attempt_count = 0
    max_attempts = 4
    begin
      attempt_count += 1
      @json = JSON.parse(open(url, openuri_params).read)
    rescue OpenURI::HTTPError
      fallback_json
    rescue Net::OpenTimeout
      fallback_json
    rescue Errno::ECONNRESET
      fallback_json
    rescue SocketError, Net::ReadTimeout
      fallback_json
      retry if attempt_count < max_attempts
    rescue StandardError
      fallback_json
    else
      @json
    end
  end
  # rubocop:enable Metrics/MethodLength:

  # rubocop:disable Layout/LineLength
  def fallback_json
    { 'location' => { 'name' => 'Addis Ababa', 'country' => 'Ethiopia', 'localtime' => '2020-10-26 15:58' }, 'current' => { 'temp_c' => 23.0, 'temp_f' => 73.4, 'condition' => { 'text' => 'Sunny', 'icon' => '//cdn.weatherapi.com/weather/64x64/day/113.png' } } }
  end
  # rubocop:enable Layout/LineLength

  def top_voted_article
    Article.top_voted
  end

  def top_of_category(category)
    Category.most_recent(category)
  end

  def priority_categories(limit = nil)
    Category.top_priority(limit)
  end
end
