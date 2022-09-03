class ChangeColumnNameInCommentsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :AuthorId, :user_id 
  end
end
