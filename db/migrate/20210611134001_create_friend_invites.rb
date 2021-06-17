class CreateFriendInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_invites do |t|
      t.integer :sender_id
      t.integer :reciever_id

      t.timestamps
    end
  end
end
