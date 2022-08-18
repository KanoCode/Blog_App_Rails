class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :updates_post_counter

  def recent_comments
    comments.limit(3).order(created_at: :desc)
  end

  private

  def updates_post_counter
    user.increment!(:postsCounter)
  end
end
