class VotesController < ApplicationController
  def create
    vote = current_user.votes.new(article_id: params[:article_id])

    if vote.save

    else
      
    end
  end
end
