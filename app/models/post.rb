class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :updates_post_counter

  def updates_post_counter
    user.increment!(:postsCounter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
