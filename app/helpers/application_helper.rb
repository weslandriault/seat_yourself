module ApplicationHelper
	def reservation_time_options(restaurant)
		times = (restaurant.opens_at...restaurant.closes_at).map do |hour|
			[pretty_time(hour), hour]
		end
		# options_for_select(times)
		times
	end

	def restaurant_time_options
		option_times = (0..23).map do |hour|
			[pretty_time(hour), hour]
		end
	end

	def map_times(range)
		range.map do |hour|
			[pretty_time(hour), hour]
		end
	end

	def pretty_time(hour)
		x = 1
		display = Time.new(x, x, x, hour, 00, x)
		display.strftime("%I:%M %p")
	end
end
