class ChangeColumnNameInPostsTable < ActiveRecord::Migration[7.0]
  def change
      rename_column :posts, :AuthorId, :user_id
  end
end
