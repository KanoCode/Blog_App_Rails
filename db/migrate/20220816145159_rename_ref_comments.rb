class RenameRefComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :AuthorId
  end
end
