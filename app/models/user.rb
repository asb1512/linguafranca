class User < ActiveRecord::Base
   has_secure_password
   has_one_attached :profile_pic
   has_many :invitations
   has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
   has_many :language_users
   has_many :languages, through: :language_users
   # has_many :native_languages through: :language_users source: 'example_source'
   # search rails guides options for associations

   validates :email, :username, :first_name, :last_name, :age, :skype_username, presence: true

   def full_name
      result = self.first_name + " " + self.last_name
      result
   end

   #methods for retrieving a user's language info
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
      results = []
      query = LanguageUser.all.where(language_id: current_user.foreign_language_id).where(foreign_language: false).each do |lang_user|
         u = User.find_by(id: lang_user.user_id)
         if u
            results << u
         end
      end
      results
   end

   #methods dealing with invitations (friend requests)
   def friends
      friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
      friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
      ids = friends_i_sent_invitation + friends_i_got_invitation
      User.where(id: ids)
   end

   def friend_with?(user)
      Invitation.confirmed_record?(id, user.id)
   end

   # def send_invitation(user)
   #    invitations.create(friend_id: user.id)
   # end
   
end