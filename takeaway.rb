class Takeaway
	def initialize
		@dishes = []
	end
	
	attr_reader :dishes

	def add_dish item
		dishes << item
	end

	def list_dishes
		strings = dishes.map.with_index do |item, i|
			"#{i+1}. #{(item[:name]+';').ljust(19)}£#{'%.2f' % item[:price]}"
		end
		strings.join "\n"
	end

	def place_order order
		correct_payment order
		send_message
	end

	def send_message
		"dave"
	end

	def correct_payment order
		new_orders = order[:dishes].zip(order[:quantities])
		new_orders.map! do |item|
			name, quantity = item
			dish = dishes.find{|dish| dish[:name] == name}
			dish[:price] * quantity
		end
		price = new_orders.inject(:+).round(2)
		raise "Incorrect total" unless price == order[:payment]
	end

	def arrival_time
		hr = Time.now.hour + 1
		min = Time.now.min
		'%02d:%02d' % [hr, min] 
	end
end