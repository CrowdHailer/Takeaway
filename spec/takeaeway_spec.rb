require './takeaway'

describe Takeaway do
	let(:takeaway) { Takeaway.new }
	let(:fried_chicken) { {name: "fried chicken", price: 1.24} }
	let(:chicken_burger) { {name: "chicken burger", price: 2.30} }

	it 'should be initialized with no dishes' do
		expect(takeaway.dishes).to be_empty
	end

	it 'should be possible to add dishes' do
		takeaway.add_dish fried_chicken
		expect(takeaway.dishes).to eq [fried_chicken]
	end

	it 'should be able to list dishes and their price' do
		takeaway.add_dish fried_chicken
		expect(takeaway.list_dishes).to eq "1. fried chicken;     £1.24"
	end

	it 'should be able to list multiple dishes' do
		takeaway.add_dish fried_chicken
		takeaway.add_dish chicken_burger
		expect(takeaway.list_dishes).to eq(
			"1. fried chicken;     £1.24\n2. chicken burger;    £2.30"
		)
	end

	it 'should return the time 1hr from now' do
		arrival = takeaway.arrival_time
		puts arrival
		expect(arrival).to match /\d{2}:\d{2}/
	end

	context 'placeing an order' do
		let(:order) { {dishes: ["fried chicken", "chicken burger"], quantities: [2,1], payment: 4.78} }
		let(:wrong_order) { {dishes: ["fried chicken"], quantities: [1], payment: 24 } }
		let(:chicken_shop) do
			takeaway = Takeaway.new
			takeaway.add_dish fried_chicken
			takeaway.add_dish chicken_burger
			takeaway
		end

		it 'should check the order total' do
			chicken_shop.stub(:send_message).and_return("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
			expect{chicken_shop.place_order order}.not_to raise_error
			expect{chicken_shop.place_order wrong_order}.to raise_error "Incorrect total"
		end

		it 'should try to send confirmation messge if total correct' do
			chicken_shop.stub(:arrival_time).and_return("12:00")
			chicken_shop.stub(:send_message).and_return("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
			expect(chicken_shop.place_order order).to eq("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
		end
	end
end