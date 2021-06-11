class GroupsPost < ApplicationRecord
    belongs_to :post, dependent: :destroy
    belongs_to :group
end
