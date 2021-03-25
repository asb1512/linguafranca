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

   def native_language_id
      self.native_languages.first.id
   end

   def foreign_languages
      results = []
      language_users = self.language_users.where(foreign_language: true)
      language_users.each do |e|
         result = Language.find_by(id: e.language_id)
         results << result
      end
      results
   end

   def foreign_language_id
      self.foreign_languages.first.id
   end

   def self.matching_users(current_user)
      query = LanguageUser.all.where(language_id: current_user.foreign_language_id).where(foreign_language: false).map do |lang_user|
         User.find_by(id: lang_user.user_id)
      end
   end
end