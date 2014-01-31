require './inject'

describe 'Array inject method' do
	let(:array) { [1,2,3,4,5] }

	it 'should create a total from all elements in an array and block' do
		expect(array.inject { |mem, var| mem + var }).to eq(15)
	end
end