class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :party_size, :date, :time,presence: true
	validate :availability

	private
	def availability
		unless restaurant.available?(party_size, date, time)
			errors.add(:base, "Restaurant is full bro!")
		end
	end

end