class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes , dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :updates_post_counter

  def recent_comments
    comments.limit(3).order(created_at: :desc)
  end

  private

  def updates_post_counter
    user.increment!(:posts_counter)
  end
end
