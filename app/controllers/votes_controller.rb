class VotesController < ApplicationController
  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    if vote.save
      redirect_to category_path(vote.article.category.id)
    end
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])

    if vote 
      vote.destroy
      redirect_to category_path(vote.article.category.id)
    end
  end
end
