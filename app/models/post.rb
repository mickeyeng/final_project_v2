class Post < ApplicationRecord
	has_attached_file :image, styles: { large: "800x800>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	acts_as_votable
	acts_as_taggable
	

	


	# post can't get submitted without the user_id
	validates :user_id, presence: true 
	belongs_to :user
	has_many :comments, dependent: :destroy


end
