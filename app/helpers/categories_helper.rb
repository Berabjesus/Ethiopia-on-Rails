module CategoriesHelper
  def vote_button(article)
    return if current_user.nil?

    if article.votes.map(&:user_id).any?(current_user.id)
      link_to 'Remove Vote', article_vote_path(article), method: :delete, class: 'btn btn-danger'
    else
      link_to 'Vote', article_votes_path(article), method: :post, class: 'btn btn-light border'
    end
  end

  def category_view_pattern(index, article, category)
    if (index.even? && (index % 4).zero?) || (index.odd? && ((index - 1) % 4).zero?)
      container = capture { render partial: 'picture', locals: { article: article } }
      container << capture { render partial: 'description', locals: { article: article, category: @category } }
    else
      container = capture { render partial: 'description', locals: { article: article, category: category } }
      container << capture { render partial: 'picture', locals: { article: article } }
    end
    container
  end
end
