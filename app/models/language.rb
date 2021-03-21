class Language < ActiveRecord::Base
   has_many :users
   has_many :users, through: :languages_users
   has_and_belongs_to_many :flags
end