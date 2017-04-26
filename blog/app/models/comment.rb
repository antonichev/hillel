class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.last_comments(count = 5)
    order('created_at DESC').limit(count)
  end
end
