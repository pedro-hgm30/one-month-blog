class Post < ApplicationRecord
  validates :title, presence: true
	validates :body, presence: true
  belongs_to :author
  has_many :comments, dependent: :delete_all
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.search(query)
  	where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
