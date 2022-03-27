class Note < ApplicationRecord
	validates :content, presence: true 
	
	belongs_to :track
	belongs_to :user 
end
