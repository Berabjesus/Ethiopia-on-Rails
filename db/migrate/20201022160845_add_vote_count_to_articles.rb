class AddVoteCountToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :vote_count, :integer
  end
end
