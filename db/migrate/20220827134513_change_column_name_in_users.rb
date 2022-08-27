class ChangeColumnNameInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postsCounter, :integer 
    add_column :users, :posts_counter, :integer, default: 0 
  end
end
