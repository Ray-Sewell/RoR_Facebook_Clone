class RemoveOwnerFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :owner, :integer
  end
end
