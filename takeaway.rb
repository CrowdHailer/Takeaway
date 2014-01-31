class Takeaway
	def initialize
		@dishes = []
	end
	
	attr_reader :dishes

	def add_dish item
		dishes << item
	end
end