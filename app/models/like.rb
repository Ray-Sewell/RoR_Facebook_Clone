class Like < ApplicationRecord
    belongs_to :posts
    belongs_to :comments
end
