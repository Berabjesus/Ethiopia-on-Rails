module CategoriesHelper
  def vote_button article
    if article.votes.map {|v| v.user_id}.any?(current_user.id)
      link_to 'Remove Vote', article_vote_path(article),method: :delete, class: 'btn btn-danger btn-z-index '
    else
      link_to 'Vote', article_votes_path(article),method: :post, class: 'btn btn-light border btn-z-index '
    end
  end
end
