class Track < ApplicationRecord
	validates :title, :ord, presence: true
	validates :ord, uniqueness: { scope: :album_id }
	validates :bonus, inclusion: { in: [false, true] }
	after_initialize :set_defaults

	belongs_to :album
	has_one :band,
		through: :album,
		source: :band

	has_many :notes,
		dependent: :destroy

	private 

	def set_defaults
		self.bonus ||= false
	end
end
