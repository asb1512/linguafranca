class Flag < ActiveRecord::Base
   has_many :languages
   has_many :languages, through: :flags_languages
end