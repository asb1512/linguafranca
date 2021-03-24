class User < ActiveRecord::Base
   has_secure_password
   has_one_attached :profile_pic
   has_many :invitations
   has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
   has_many :language_users
   has_many :languages, through: :language_users

   validates :email, :password, :username, :first_name, :last_name, :age, :skype_username, presence: true

   def native_languages
      results = []
      language_users = self.language_users.where({foreign_language: false})
      language_users.each do |e|
         result = Language.find_by(id: e.language_id)
         results << result
      end
      results
   end

   def foreign_languages
      results = []
      language_users = self.language_users.where({foreign_language: true})
      language_users.each do |e|
         result = Language.find_by(id: e.language_id)
         results << result
      end
      results
   end
end