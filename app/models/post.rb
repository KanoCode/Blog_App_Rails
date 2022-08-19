class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :updates_post_counter

  def recent_comments
    comments.limit(3).order(created_at: :desc)
  end

  private

  def updates_post_counter
    user.increment!(:postsCounter)
  end
end
