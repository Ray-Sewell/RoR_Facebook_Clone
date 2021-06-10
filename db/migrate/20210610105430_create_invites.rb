class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.integer :invitee_id
      t.integer :sender_id
      t.integer :group_id

      t.timestamps
    end
  end
end
