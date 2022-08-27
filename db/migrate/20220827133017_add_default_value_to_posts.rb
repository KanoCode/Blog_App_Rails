class AddDefaultValueToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :commentsCounter, :integer 
    add_column :posts, :comments_counter, :integer, default: 0 
  end
end
