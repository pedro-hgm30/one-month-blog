class Post < ApplicationRecord
  belongs_to :author
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.search(query)
  	where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
