class Array
	def my_inject init=0
		for element in self do
			init = yield(init, element)
		end
	end
end