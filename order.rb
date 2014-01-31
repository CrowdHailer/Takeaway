class Order
	def initialize
		@items = []
	end

	attr_reader :items

	def add_item item, number=1
		number.times { items << item }
	end
end
