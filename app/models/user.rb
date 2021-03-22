class User < ActiveRecord::Base
   has_secure_password
   has_one_attached :profile_pic
   has_many :invitations
   has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
   has_many :language_users
   has_many :languages, through: :language_users

   def native_language
      self.language_users.where({foreign_language: false}).each do |lang|
         result = Language.find_by(id: lang.language_id)
         result.each do |e|
            result
         end
      end
   end
end