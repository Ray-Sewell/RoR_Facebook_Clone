class Group < ApplicationRecord
    belongs_to :leader, class_name:"User", foreign_key: "leader_id"

    has_many :groups_users
    has_many :users, through: :groups_users, source: :user

    has_many :groups_posts, dependent: :destroy
    has_many :posts, through: :groups_posts, source: :post, dependent: :destroy

    has_many :invites, dependent: :destroy


    validates :name, presence: true, length: {minimum: 3, maximum: 20}
end
