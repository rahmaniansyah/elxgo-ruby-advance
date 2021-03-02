require './lib/library.rb'
require './lib/book.rb'

describe 'Main' do
   let(:first_library) {Library.instance}
   let(:book_command) {Book.new}

   let(:put_book_1) {'put_book|9780747532743|Harry Potter 1|J. K. Rowling'}
   let(:put_book_2) {'put_book|9780807281918|Harry Potter 2|J. K. Rowling'}
   let(:put_book_3) {'put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck'}
   let(:take_book_from_1) {'take_book_from|010101'}
   let(:find_book) {'find_book|9780807281918'}
   let(:search_books_by_title) {'search_books_by_title|Harry Potter'}
   
   context 'build_library' do
      it 'return build_library response' do
         input = 'build_library|1|1|2'
         command, *args = input.split("|")

         expect(first_library.send(:build, 1,1,2)).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
      end
   end

   
   context 'created new book' do
      before(:each) do
         first_library.send(:build, 1,1,2)
      end

      it 'returns success when input put_book' do
         command, *args = put_book_1.split("|")

         expect(book_command.execute(command, args)).to eq "Allocated address: 010101"
      end
   end

   context 'book already created, and do' do
      before(:each) do
         first_library.send(:build, 2,1,2)

         command, *args = put_book_1.split("|")
         book_command.execute(command, args)

         command, *args = put_book_2.split("|")
         book_command.execute(command, args)

         command, *args = put_book_3.split("|")
         book_command.execute(command, args)
      end

      it 'take_book_from input' do
         command, *args = take_book_from_1.split("|")

         expect(book_command.execute(command, args)).to eq "Slot 010101 is free"
      end

      it 'find_book input' do
         command, *args = find_book.split("|")
         
         expect(book_command.execute(command, args)).to eq "Found the book at 010102"
      end

      it 'list_books input' do
         command, *args = "list_books".split("|")
         
         expect(book_command.execute(command, args)).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling", "020101: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
      end

      it 'search_books_by_title input' do
         command, *args = "search_books_by_title|Harry Potter".split("|")
         
         expect(book_command.execute(command, args)).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
      end

      it 'search_books_by_author input' do
         command, *args = "search_books_by_author|Kent Beck".split("|")
         
         expect(book_command.execute(command, args)).to eq ["020101: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
      end
   end
end