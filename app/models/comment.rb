class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :updates_comments_counter
  def updates_comments_counter
    post.increment!(:commentsCounter)
  end
end
