class Post < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    has_many :comments

    has_many :groups_posts
    has_many :groups, through: :groups_posts, source: :group

    attr_accessor :group_id
end
