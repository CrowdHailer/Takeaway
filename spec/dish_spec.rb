require './dish'

describe Dish do
	let(:burger) { Dish.new "burger", 2.20 }

	it 'should be initialized with a name' do
		expect(burger.name).to eq("burger")
	end

	it 'should be initialized with a price' do
		expect(burger.price).to eq(2.20)
	end
end