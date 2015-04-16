class Podcast < ActiveRecord::Base
	has_and_belongs_to_many :beers
	validates :title, presence: true, uniqueness: true

	after_update :truncate

	def truncate
		self.subtitle = self.description.slice(0..121)
	end


end
