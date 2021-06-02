class Group < ApplicationRecord
    belongs_to :leader, class_name:"User", foreign_key: "leader_id"

    has_many :groups_users
    has_many :users, through: :groups_users, source: :user
end
