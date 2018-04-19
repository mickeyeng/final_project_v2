class AddUseridToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :userid, :integer
  end
end
