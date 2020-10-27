class RenameUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :user_id, :AuthorId
  end
end
