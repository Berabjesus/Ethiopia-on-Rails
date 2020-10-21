module ApplicationHelper
  def access_buttons
    if logged_in? 
      # link = capture {link_to current_user.name, class: 'text-uppercase border-dark pr-2'}
      link = capture {link_to (image_tag('', class: 'fa fa-user pr-2')), users_path}
      link << content_tag(:ins, "|")
      link << capture {link_to 'Sign Out', articles_path, class: 'text-uppercase border-dark ml-2'}
    else
      link = capture {link_to 'Login', articles_path, class: 'text-uppercase border-dark pr-2'}
      link << content_tag(:ins, "|")
      link << capture {link_to 'Register', articles_path, class: 'ml-1 text-uppercase'}
    end
    link
  end
end
