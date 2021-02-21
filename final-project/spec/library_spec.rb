require './lib/library.rb'

RSpec.describe Library do
    let(:first_library) {Library.new(1,1,2)}
    let(:second_library) {Library.new(2,1,3)}

	 let(:book_1) {Book.new("9780747532743", "Harry Potter 1", "J. K. Rowling")}
	 let(:book_2) {Book.new("9780201485677", "Refactoring", "Martin Fowler, Kent Beck")}

	before(:each) do
		first_library.build
	end

    context '#build' do
        it 'return ["Shelf 1 with 1 rows and 2 columns is added"] when params input |1|1|2' do
            expect(first_library.build).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
        end

        it 'return ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"] when params input |2|1|3' do
            expect(second_library.build).to eq ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"]
        end
    end
end