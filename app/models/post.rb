class Post < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :author

  # without this dependency relation
  # wouldn't be possible to delete a post with comments
  has_many :comments, dependent: :delete_all
  
  # this syntax is specific from the friendly_id gem
  # It's using the post title as a slug
  # the slug is used to identify the post instead of the id
  # this leads to a better UX
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  # this is part of the search logic
  # it receives a query as an argument
  # and search for that on the database
  def self.search(query)
  	where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
