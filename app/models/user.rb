class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable



  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(uel)\.ac.uk\z/, message: "must end in uel.ac.uk account" }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
end
