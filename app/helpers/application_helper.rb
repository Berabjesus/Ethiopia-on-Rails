module ApplicationHelper
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
end
