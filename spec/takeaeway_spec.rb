require './takeaway'
require './dish'

describe Takeaway do
	let(:takeaway) { Takeaway.new }
	let(:fried_chicken) { Dish.new "fried chicken", 1.24 }
	let(:chicken_burger) { Dish.new "chicken burger", 2.30 }

	it 'should be initialized with no dishes on the menu' do
		expect(takeaway.dishes).to be_empty
	end

	it 'should be possible to add a dish to the list of dishes' do
		takeaway.add_dish fried_chicken
		expect(takeaway.dishes).to eq [fried_chicken]
	end

	it 'should be able to display a list of dishes and their price' do
		takeaway.add_dish fried_chicken
		expect(takeaway.list_dishes).to eq "1. fried chicken;     £1.24"
	end

	it 'should list multiple dishes as a menu' do
		takeaway.add_dish fried_chicken
		takeaway.add_dish chicken_burger
		expect(takeaway.list_dishes).to eq(
			"1. fried chicken;     £1.24\n2. chicken burger;    £2.30"
		)
	end

	it 'should be able to return the time 1hr from now' do
		arrival = takeaway.arrival_time
		puts arrival
		expect(arrival).to match /\d{2}:\d{2}/
	end

	context 'placing an order' do
		let(:order) do
			building_order = Order.new
			building_order.add_item fried_chicken, 2
			building_order.add_item chicken_burger
			building_order.total = 4.78 
			building_order
		end
		let(:wrong_order) do
			building_order = Order.new
			building_order.add_item fried_chicken
			building_order.total = 24
			building_order
		end

		let(:chicken_shop) do
			takeaway = Takeaway.new
			takeaway.add_dish fried_chicken
			takeaway.add_dish chicken_burger
			takeaway
		end

		it 'should check the payment given is correct for the order' do
			chicken_shop.stub(:send_message).and_return("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
			expect{chicken_shop.place_order order}.not_to raise_error
			expect{chicken_shop.place_order wrong_order}.to raise_error "Incorrect total"
		end

		it 'should try to send confirmation messge if payment is correct' do
			chicken_shop.stub(:arrival_time).and_return("12:00")
			chicken_shop.stub(:send_message).and_return("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
			expect(chicken_shop.place_order order).to eq("HELL YEAH! Chicken is hitting your neighbourhood at 12:00")
		end
	end
end