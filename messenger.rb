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