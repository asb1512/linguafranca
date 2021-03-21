class Language < ActiveRecord::Base
   has_many :users
   has_many :users, through: languages_users
   has_many :flags
   has_many :flags, through: :flags_languages
end