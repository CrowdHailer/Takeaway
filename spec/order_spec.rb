require './order'

describe Order do
	let(:order) { Order.new }
	it 'should be initialized with no items' do
		expect(order.items).to eq([])
	end
end