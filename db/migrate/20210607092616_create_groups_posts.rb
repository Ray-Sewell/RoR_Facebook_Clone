class CreateGroupsPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_posts do |t|
      t.integer :group_id
      t.integer :post_id

      t.timestamps
    end
  end
end
