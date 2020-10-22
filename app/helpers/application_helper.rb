module ApplicationHelper
  def navigation_buttons
    link = capture {link_to 'Home', articles_path, class: 'text-uppercase border-dark pr-3'}
    Category.all.each do |category|
      link << capture {link_to "#{category.name}", category_path(category), class: 'text-uppercase border-dark pr-3'}
    end
    link << content_tag(:ins, "|") if logged_in?
    link << capture {link_to 'Create new article', new_article_path, class: 'text-uppercase border-dark pl-2'} if logged_in?
    link
  end

  def access_buttons
    if logged_in? 
      link = capture {link_to (image_tag('', class: 'fa fa-user pr-2')), users_path}
      link << content_tag(:ins, "|")
      link << capture {link_to 'Sign Out', session_path(current_user.id),method: :delete, class: 'text-uppercase border-dark ml-2'}
    else
      link = capture {link_to 'Login', articles_path, class: 'text-uppercase border-dark pr-2'}
      link << content_tag(:ins, "|")
      link << capture {link_to 'Sign up', articles_path(q: "sign up"), class: 'ml-1 text-uppercase'}
    end
    link
  end

  def sidebar_login
    unless logged_in?
      if params[:q] == "sign up"
        render '/users/sign_up'
      else
        render '/sessions/login'
      end
    end
  end

  def image_for_categories object
    if object.image?
      image_tag(object.image.url, class: 'img-fluid w-100 h-100') 
    else
      image_tag('none.png', class: 'w-100 h-100')
    end
  end

  def vote_button article
    if article.votes.map {|v| v.user_id}.any?(current_user.id)
      # vote = 
      link_to 'Remove Vote', article_vote_path(article),method: :delete, class: 'btn btn-danger'
    else
      link_to 'Vote', article_votes_path(article),method: :post, class: 'btn btn-light border'
    end
  end
end
