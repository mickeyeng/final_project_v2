class Chatroom < ApplicationRecord
	has_many :chatroom_users, :dependent => :destroy 

	has_many :users, through: :chatroom_users, :dependent => :destroy 

	has_many :messages, :dependent => :destroy 
	# dependat destroy is used to delete tables which has another table associated with a foreign key 


end
