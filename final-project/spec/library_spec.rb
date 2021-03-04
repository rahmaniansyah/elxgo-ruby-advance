require './lib/library.rb'

RSpec.describe Library do
	let(:first_library) {Library.instance}
	let(:second_library) {Library.instance}

	context '#build' do
		it 'return ["Shelf 1 with 1 rows and 2 columns is added"] when params input |1|1|2' do
			command, *args = 'build_library|1|1|2'.split("|")
			
			expect(first_library.send(:build, args)).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
		end

		it 'return ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"] when params input |2|1|3' do
			command, *args = 'build_library|2|1|3'.split("|")
			
			expect(second_library.send(:build, args)).to eq ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"]
		end
	end
end