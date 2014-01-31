class Dish
	def initialize name, price
		@name = name
		@price = price.round(2)
	end

	attr_reader :price, :name
end