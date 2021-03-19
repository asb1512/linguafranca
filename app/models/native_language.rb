class NativeLanguage < ActiveRecord::Base
   has_many :users, through: :native_languages_users
end