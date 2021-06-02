class AddLeaderIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :leader_id, :integer
  end
end
