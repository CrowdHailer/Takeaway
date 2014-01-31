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

	it 'shuld be initialized with total = 0' do
		expect(order.total).to eq(0)
	end

	it 'should be possible to give it a total' do
		order.total = 27.34
		expect(order.total).to eq(27.34)
	end
end