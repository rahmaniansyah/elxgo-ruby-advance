require './lib/book.rb'
require './lib/library.rb'

RSpec.describe Book do
   let(:first_library) {Library.instance}
   let(:book_command) {Book.new}

   let(:put_book_1) {'put_book|9780747532743|Harry Potter 1|J. K. Rowling'}
   let(:put_book_2) {'put_book|9780807281918|Harry Potter 2|J. K. Rowling'}
   let(:put_book_3) {'put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck'}
   let(:take_book_from_1) {'take_book_from|010101'}
   let(:find_book) {'find_book|9780807281918'}
   let(:search_books_by_title) {'search_books_by_title|Harry Potter'}
   
   before(:each) do
      first_library.send(:build, 1,1,2)
   end

   context '#all' do
		it 'return list of books when input list_books' do
			book_1.put_book
			book_2.put_book

			expect(book.all).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
		end

		it 'return No books at all! when input shelves are empty' do
			expect(book.all).to eq "No books at all!"
		end
	end
    
   describe '#put_book' do
      it 'returns Allocated address: 010101 when input first book' do
         expect(book_1.put_book).to eq "Allocated address: 010101"
      end

      it 'returns Allocated address: 010102 when input second book' do
         book_1.put_book

         expect(book_2.put_book).to eq "Allocated address: 010102"
      end

      it 'returns All shelves are full! when input third book' do
         book_1.put_book
         book_2.put_book

         expect(book_3.put_book).to eq "All shelves are full!"
      end   
   end

   context '#find_book' do
      it 'return Found the book at 010101 when input isbn 123' do
         book_1.put_book

         expect(book_1.find_book).to eq "Found the book at 010101"
      end

      it 'return Book not found! when input not exists' do
         expect(book_2.find_book).to eq "Book not found!"
      end
   end

   context '#search_books_by_title' do
      it 'return 010101: 9780747532743 | Harry Potter 1 | J. K. Rowling when input Harry Potter' do
         book_1.put_book

         expect(book_1.search_books_by("title","Harry Potter")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling"]
      end

      it 'return array of string when input books with the similiar title' do
         book_1.put_book
         book_3.put_book

         expect(book_3.search_books_by("title","Harry Potter")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
      end

      it 'return Book not found! when input not exists' do
         book_1.put_book

         expect(book_1.search_books_by("title","Childern's life")).to eq "Book not found!"
      end
   end

   context '#search_books_by_author' do
      it 'return books when input existing author name' do
         book_1.put_book
         book_2.put_book

         expect(book_2.search_books_by("author","Kent Beck")).to eq ["010102: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
      end

      it 'return array of string when input books with the similiar author name' do
         book_1.put_book
         book_3.put_book

         expect(book_3.search_books_by("author","Rowling")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
      end

      it 'return Book not found! when input not exists' do
         book_1.put_book

         expect(book_1.search_books_by("author","rahma")).to eq "Book not found!"
      end
   end

   context '#delete_by_slot' do
		it 'returns Slot 010101 is free when input 010101' do
         book_1.put_book

         expect(book.delete_by_slot("010101")).to eq "Slot 010101 is free"
      end

      it 'returns Invalid code! when input unexist code' do
         expect(book.delete_by_slot("999")).to eq "Invalid code!"
      end
   end
end