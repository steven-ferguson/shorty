class Url < ActiveRecord::Base
	validates :long, presence: true, url: true

	after_create :generate_shorty

private

	def generate_shorty
		update(short: "shorty#{id}")
	end
end
