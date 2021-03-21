class Flag < ActiveRecord::Base
   has_and_belongs_to_many :languages
   has_one_attached :flag_pic
end