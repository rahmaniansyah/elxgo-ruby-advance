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

	context '#take_book_from' do
		it 'returns Slot 010101 is free when input 010101' do
         book_1.put_book

         expect(first_library.take_book_from("010101")).to eq "Slot 010101 is free"
      end

      it 'returns Invalid code! when input unexist code' do
         expect(first_library.take_book_from("999")).to eq "Invalid code!"
      end
   end
    
	context '#list_books' do
		it 'return list of books when input list_books' do
			book_1.put_book
			book_2.put_book

			expect(first_library.list_books).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
		end

		it 'return No books at all! when input shelves are empty' do
			expect(first_library.list_books).to eq "No books at all!"
		end
	end
end