class VotesController < ApplicationController
  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    if vote.save
      Article.find(params[:article_id]).increment!(:vote_count)
      # redirect_to category_path(vote.article.categories.first.id)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])

    if vote
      Article.find(params[:article_id]).decrement!(:vote_count) if vote.destroy
      # redirect_to category_path(vote.article.category.id)
      redirect_back(fallback_location: root_path)
    end
  end
end
