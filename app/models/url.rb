class Url < ActiveRecord::Base
	validates :long, presence: true, url: true
  has_many :visits
  belongs_to :user

	after_create :generate_shorty

private

	def generate_shorty
		update(short: "shorty#{id}")
	end
end
