require 'twilio-ruby'
class Messenger
	def initialize sid, auth
		@client = Twilio::REST::Client.new sid, auth
		@from = "+441985250052"
	end

	def send_message recipient, message_body
		content = {to: recipient, from: from, body: message_body}
	 	client.account.messages.create(content)
	end

	private
	attr_reader :client, :from
end

class Takeaway
	def initialize
		@dishes = []
		@messenger = Messenger.new "ACc24f3853500f9dc3d1896fcc898a129a", "593a0f400842001980ebe4eb92239e7f"
	end
	
	attr_reader :dishes, :messenger

	def add_dish item
		dishes << item
	end

	def list_dishes
		strings = dishes.map.with_index do |item, i|
			"#{i+1}. #{item.inspect}"
		end
		strings.join "\n"
	end

	def place_order order
		raise "Incorrect total" unless correct_payment(order)
		send_message arrival_time
	end

	def send_message arrival_time
		body = "HELL YEAH! Chicken is hitting your neighbourhood at #{arrival_time}"
		messenger.send_message "+447596279256", body
	end

	def correct_payment order
		price = order.items.inject(0) { |total, item| total + item.price }
		price.round(2) == order.total
	end

	def arrival_time
		'%02d:%02d' % [Time.now.hour + 1, Time.now.min] 
	end
end