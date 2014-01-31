class Order
	def initialize
		@items = []
		@total = 0
	end

	attr_reader :items
	attr_accessor :total

	def add_item item, number=1
		number.times { items << item }
	end
end
