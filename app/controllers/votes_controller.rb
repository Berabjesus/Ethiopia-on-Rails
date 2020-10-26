class VotesController < ApplicationController
  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    return unless vote.save

    Article.find(params[:article_id]).increment!(:vote_count)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    return unless vote

    Article.find(params[:article_id]).decrement!(:vote_count) if vote.destroy
    redirect_back(fallback_location: root_path)
  end
end
