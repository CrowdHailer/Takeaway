require './takeaway'

describe Takeaway do
	let(:chicken_shop) { Takeaway.new }
	let(:fried_chicken) { {name: "fried chicken", price: 1.24} }
	let(:chicken_burger) { {name: "chicken_burger", price: 2.30}}

	it 'should be initialized with no dishes' do
		expect(chicken_shop.dishes).to be_empty
	end

	it 'should be possible to add dishes' do
		chicken_shop.add_dish fried_chicken
		expect(chicken_shop.dishes).to eq [fried_chicken]
	end

	it 'should be able to list dishes and their price' do
		chicken_shop.add_dish fried_chicken
		expect(chicken_shop.list_dishes).to eq "1. fried chicken;     £1.24"
	end

	it 'should be able to list multiple dishes' do
		chicken_shop.add_dish fried_chicken
		chicken_shop.add_dish chicken_burger
		expect(chicken_shop.list_dishes).to eq(
			"1. fried chicken;     £1.24\n2. chicken burger;    £2.30"
		)
	end
end