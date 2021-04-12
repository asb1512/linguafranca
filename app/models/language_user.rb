class LanguageUser < ActiveRecord::Base
   belongs_to :language
   belongs_to :user

   validates :language_id, :user_id, presence: true
end