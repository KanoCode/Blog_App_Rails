class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :text, presence: true
  validates :text, length: { maximum: 100 }

  after_save :updates_comments_counter
  def updates_comments_counter
    post.increment!(:comments_counter)
  end
end
