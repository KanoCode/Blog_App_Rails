class RenameRefPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :AuthorId
  end
end
