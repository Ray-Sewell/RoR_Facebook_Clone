class Invite < ApplicationRecord
    belongs_to :invited_user, class_name:"User", foreign_key:"invitee_id"
    belongs_to :sent_user, class_name:"User", foreign_key:"sender_id"
    belongs_to :group
end
