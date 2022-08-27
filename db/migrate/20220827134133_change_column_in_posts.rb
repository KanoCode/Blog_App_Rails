class ChangeColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likesCounter, :integer 
    add_column :posts, :likes_counter, :integer, default: 0 
  end
end
