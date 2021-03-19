class ForeignLanguage < ActiveRecord::Base
   has_many :users, through: foreign_languages_users
end