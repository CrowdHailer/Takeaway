require './order'

describe Order do
	let(:order) { Order.new }
	it 'should be initialized with no items' do
		expect(order.items).to eq([])
	end

	it 'should be possible to add an item' do
		food = double :food
		order.add_item food
		expect(order.items).to eq([food])
	end

	it 'should be possible to add an item multiple times' do
		food = double :food
		order.add_item food, 3
		expect(order.items).to eq([food, food, food])
	end
end