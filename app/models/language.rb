class Language < ActiveRecord::Base
   has_many :language_users
   has_many :users, through: :language_users
   has_and_belongs_to_many :flags
   
   validates :name, :wikipedia_link, presence: true
end