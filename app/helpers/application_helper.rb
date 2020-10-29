module ApplicationHelper
  # rubocop:disable Layout/LineLength
  def navigation_buttons
    link = capture { link_to 'Home', articles_path, class: 'text-uppercase border-dark pr-3  mb-3 mb-md-0' }
    priority_categories(5).each do |category|
      link << capture { link_to category.name, category_path(category), class: 'text-uppercase border-dark pr-3  mb-3 mb-md-0 ' }
    end
    link << separetor if logged_in?
    if logged_in?
      link << capture { link_to 'Create new article', new_article_path, class: 'text-uppercase border-dark pl-md-2  mb-3 mb-md-0 ' }
    end
    link
  end

  def access_buttons
    if logged_in?
      link = capture { link_to image_tag('', class: 'fa fa-user pr-2'), user_path(current_user) }
      link << separetor
      link << capture { link_to 'Sign Out', session_path(current_user.id), method: :delete, class: 'text-uppercase border-dark ml-md-2 mb-3 mb-md-0' }
    else
      link = capture { link_to 'Login', articles_path, class: 'text-uppercase border-dark pr-2 mb-3 mb-md-0' }
      link << separetor
      link << capture { link_to 'Sign up', articles_path(q: 'sign up'), class: 'ml-md-1 text-uppercase mb-3 mb-md-0' }
    end
    link
  end

  def separetor
    content_tag(:ins, '|', class: 'd-none d-md-block')
  end

  def sidebar_login
    return if logged_in?

    if params[:q] == 'sign up'
      render '/users/sign_up'
    else
      render '/sessions/login'
    end
  end

  def image_render(article)
    return image_tag('none.png', class: 'h-100 w-100 border') unless defined? article.image

    if article.image?
      image_tag(article.image.url, class: 'w-100 h-100')
    else
      image_tag('none.png', class: 'h-100 w-100 border')
    end
  end

  def extract_title(article)
    if defined? article.title
      article.title
    else
      'No article titles found here'
    end
  end

  def extract_text(article)
    if defined? article.text
      article.text
    else
      'No article texts found here'
    end
  end

  def exctract_weather_info
    current_weather = weather_info
    country = current_weather['location']['country']
    city = current_weather['location']['name']
    time = current_weather['location']['localtime']
    icon = current_weather['current']['condition']['icon']
    degree_c = current_weather['current']['temp_c']
    degree_f = current_weather['current']['temp_f']

    { country: country, city: city, time: time, icon: icon, degree_c: degree_c, degree_f: degree_f }
  end

  def edit_access article
    link_to 'edit', edit_article_path(article), class: 'btn theme-bg-2 text-white mt-3' if current_user == article.user
  end

  def show_article_content
    render 'show'
  end
  # rubocop:enable Layout/LineLength
end
