class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  belongs_to :author, optional: true
  validates :body, presence: true
end
