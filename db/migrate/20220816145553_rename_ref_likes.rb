class RenameRefLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :AuthorId
  end
end