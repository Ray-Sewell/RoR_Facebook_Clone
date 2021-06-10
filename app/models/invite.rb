class Invite < ApplicationRecord
    has_one :invited_user, class_name:"User", foreign_key:"invitee_id"
    has_one :sent_user, class_name:"User", foreign_key:"sender_id"
    has_one :group
end
