module ApplicationHelper
  def navigation_buttons
    link = capture { link_to 'Home', articles_path, class: 'text-uppercase border-dark pr-3  mb-3 mb-md-0' }
    priority_categories(5).each do |category|
      link << capture { link_to category.name, category_path(category), class: 'text-uppercase border-dark pr-3  mb-3 mb-md-0 ' }
    end
    link << separator if logged_in?
    if logged_in?
      link << capture { link_to 'Create new article', new_article_path, class: 'text-uppercase border-dark pl-md-2  mb-3 mb-md-0 ' }
    end
    link
  end

  def access_buttons
    if logged_in?
      link = capture { link_to image_tag('', class: 'fa fa-user pr-2'), user_path(current_user) }
      link << separator
      link << capture { link_to 'Sign Out', session_path(current_user.id), method: :delete, class: 'text-uppercase border-dark ml-md-2 mb-3 mb-md-0' }
    else
      link = capture { link_to 'Login', articles_path, class: 'text-uppercase border-dark pr-2 mb-3 mb-md-0' }
      link << separator
      link << capture { link_to 'Sign up', articles_path(q: 'sign up'), class: 'ml-md-1 text-uppercase mb-3 mb-md-0' }
    end
    link
  end

  def separator
    content_tag(:ins, '|', class: 'd-none d-md-block')
  end

  def sidebar_login
    unless logged_in?
      if params[:q] == 'sign up'
        render '/users/sign_up'
      else
        render '/sessions/login'
      end
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
end
