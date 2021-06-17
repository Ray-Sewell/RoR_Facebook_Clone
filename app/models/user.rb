class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", dependent: :destroy
  has_many :comments, foreign_key: "author_id", dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :created_groups, class_name:"Group", foreign_key: "leader_id", dependent: :destroy

  has_many :groups_users
  has_many :groups, through: :groups_users, source: :group

  has_many :pending_invites, class_name:"Invite", foreign_key: "invitee_id"
  has_many :sent_invites, class_name:"Invite", foreign_key: "sender_id"

  has_many :pending_friend_invites, class_name:"FriendInvite", foreign_key: "reciever_id"
  has_many :sent_friend_invites, class_name:"FriendInvite", foreign_key: "sender_id"
 
  has_many :friends, dependent: :destroy
  has_many :accepted_friends, through: :friends, source: :friend

  validates :name, presence: true, length: {minimum: 4, maximum: 30}
end
