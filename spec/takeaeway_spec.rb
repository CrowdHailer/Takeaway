require './takeaway'

describe Takeaway do
	let(:chicken_shop) { Takeaway.new }
	it 'should be initialized with no dishes' do
		expect(chicken_shop.dishes).to be_empty
	end

	it 'should be possible to add dishes' do
		chicken_shop.add_dish({name: "fried chicken", price: "£1.24"})
		expect(chicken_shop.dishes).to eq([{name: "fried chicken", price: "£1.24"}])
	end
end