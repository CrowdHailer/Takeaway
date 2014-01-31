require 'twilio-ruby'

class Takeaway
	def initialize
		@dishes = []
		@client = Twilio::REST::Client.new("ACc24f3853500f9dc3d1896fcc898a129a", 
			"593a0f400842001980ebe4eb92239e7f")
		@message_content = {to: "+447596279256", from: "+441985250052"}
	end
	
	attr_reader :dishes, :message_content, :client

	def add_dish item
		dishes << item
	end

	def list_dishes
		strings = dishes.map.with_index do |item, i|
			"#{i+1}. #{(item.name+';').ljust(19)}£#{'%.2f' % item.price}"
		end
		strings.join "\n"
	end

	def place_order order
		raise "Incorrect total" unless correct_payment(order)
		send_message arrival_time
	end

	def send_message arrival_time
		body = "HELL YEAH! Chicken is hitting your neighbourhood at #{arrival_time}"
		current = message_content.dup
		current[:body] = body
		client.account.messages.create(current)
	end

	def correct_payment order
		price = order.items.inject(0) { |total, item| total + item.price }
		price.round(2) == order.total
	end

	def arrival_time
		'%02d:%02d' % [Time.now.hour + 1, Time.now.min] 
	end
end