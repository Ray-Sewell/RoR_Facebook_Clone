class Post < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    has_many :comments, dependent: :destroy

    has_one :groups_post
    has_one :group, through: :groups_post, source: :group

    attr_accessor :group_id

    has_many :likes, dependent: :destroy
    has_many :user_likes, through: :likes, source: :user


    validates :title, presence: true, length: {minimum: 4, maximum: 30}
    validates :body, presence: true, length: {minimum: 4, maximum: 255}
end
