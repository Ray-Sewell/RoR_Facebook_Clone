class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :author, class_name: "User", foreign_key: "author_id"


    validates :body, presence: true, length: {minimum: 4, maximum: 40}
end
