class Comment < ApplicationRecord
  
  # a comment must be associeted with a post
  # but not necessarily with a user or an author
  # since they can delete their accounts 
  # but the comment will stay there

  belongs_to :post
  belongs_to :user, optional: true
  belongs_to :author, optional: true
  validates :body, presence: true

end
