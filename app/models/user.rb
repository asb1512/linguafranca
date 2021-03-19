class User < ActiveRecord::Base
   has_secure_password
   has_one_attached :profile_pic
   has_many :invitations
   has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
   has_many :foreign_languages, through: :foreign_languages_users
   has_many :native_languages, through: :native_languages_users
end