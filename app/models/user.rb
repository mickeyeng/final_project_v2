class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :profile_picture, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/
  acts_as_voter



  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(uel)\.ac.uk\z/, message: "must end in uel.ac.uk account" }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  has_many :posts
end
