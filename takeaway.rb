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
			"#{i+1}. #{(item[:name].gsub('_', ' ')+';').ljust(19)}£#{'%.2f' % item[:price]}"
		end
		strings.join "\n"
	end

	def arrival_time
		hr = Time.now.hour + 1
		min = Time.now.min
		'%02d:%02d' % [hr, min] 
	end
end