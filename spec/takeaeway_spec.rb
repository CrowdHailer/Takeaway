require './takeaway'

describe Takeaway do
	let(:chicken_shop) { Takeaway.new }
	it 'should be initialized with no dishes' do
		expect(chicken_shop.dishes).to be_empty
	end
end