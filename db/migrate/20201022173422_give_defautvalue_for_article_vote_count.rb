class GiveDefautvalueForArticleVoteCount < ActiveRecord::Migration[6.0]
  def change
    change_column :articles , :vote_count , :integer ,default: 0
  end
end
