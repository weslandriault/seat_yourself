module ApplicationHelper

	def reservation_time_options(restaurant)

		def restaurant_times(start, finish)
			(start..finish).map do |hour|
			[pretty_time(hour), hour]	# options_for_select(times)
			end
		end

		if restaurant.opens_at == restaurant.closes_at
			(0..23).map do |hour|
			[pretty_time(hour), hour]
			end
		elsif restaurant.closes_at < restaurant.opens_at
			times = restaurant_times(0, restaurant.closes_at).concat(restaurant_times(restaurant.opens_at, 23))	
		else times = (restaurant.opens_at...restaurant.closes_at).map do |hour|
			[pretty_time(hour), hour]
			end
			times
		end
	end


		# if restaurant.closes_at <= restaurant.opens_at
		# 	times1 = (0..restaurant.closes_at).map do |hour|
		# 		[pretty_time(hour), hour]
		# 	end

		# 	times2 = (restaurant.opens_at..23).map do |hour|
		# 		[pretty_time(hour), hour]
		# 	end

		# 	times1.concat(times2)
		# 	times1
			
		

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
