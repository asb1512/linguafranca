class Flag < ActiveRecord::Base
   has_and_belongs_to_many :languages
   has_one_attached :flag_pic

   validates :nationality, :wikipedia_link, :name, presence: true, uniqueness: true
end