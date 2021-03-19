class Flag < ActiveRecord::Base
   has_many :foreign_languages
   has_many :native_languages
end