class Post < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    has_many :comments

    has_one :groups_post
    has_one :group, through: :groups_post, source: :group

    attr_accessor :group_id

    has_many :likes
    has_many :user_likes, through: :likes, source: :user
end
