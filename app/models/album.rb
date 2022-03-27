class Album < ApplicationRecord
	validates :title, :year, presence: true
	validates :title, uniqueness: { scope: :band_id } 
	validates :live, inclusion: [true, false]
	validates :year, numericality: { minimum: 1900, maximum: 9000 }
	after_initialize :set_defaults 

	belongs_to :band
	has_many :tracks, dependent: :destroy

	private 

	def set_defaults
		self.live ||= false
	end
end
