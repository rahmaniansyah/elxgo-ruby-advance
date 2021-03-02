require './lib/library.rb'
require './lib/book.rb'

describe 'Command' do
   let(:first_library) {Library.instance}
   let(:book_command) {Book.new}

   let(:put_book_1) {'put_book|9780747532743|Harry Potter 1|J. K. Rowling'}
   let(:put_book_2) {'put_book|9780807281918|Harry Potter 2|J. K. Rowling'}
   let(:put_book_3) {'put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck'}
   
   describe PutBookCommand do
      before(:each) do
         first_library.send(:build, 1,1,2)
      end

      it 'returns Allocated address: 010101 when input first book' do
         command, *args = put_book_1.split("|")

         expect(book_command.execute(command, args)).to eq "Allocated address: 010101"
      end

      it 'returns Allocated address: 010102 when input second book' do
         command, *args = put_book_2.split("|")
         book_command.execute(command, args)

         expect(book_command.execute(command, args)).to eq "Allocated address: 010102"
      end

      it 'returns All shelves are full! when input third book' do
         command, *args = put_book_2.split("|")
         book_command.execute(command, args)
         book_command.execute(command, args)

         expect(book_command.execute(command, args)).to eq "All shelves are full!"
      end
   end

   describe TakeBookCommand do
      before(:each) do
         first_library.send(:build, 1,1,2)
   
         command, *args = put_book_1.split("|")
         book_command.execute(command, args)
      end

      it 'returns Slot 010101 is free when input 010101' do
         command, *args = 'take_book_from|010101'.split("|")

         expect(book_command.execute(command, args)).to eq "Slot 010101 is free"
      end

      it 'returns Invalid code! when input unexist code' do
         command, *args = 'take_book_from|999'.split("|")

         expect(book_command.execute(command, args)).to eq "Invalid code!"
      end
   end

   describe FindBookCommand do
      before(:each) do
         first_library.send(:build, 1,1,2)
   
         command, *args = put_book_2.split("|")
         book_command.execute(command, args)
      end

      it 'return Found the book at 010101 when input isbn' do
         command, *args = 'find_book|9780807281918'.split("|")

         expect(book_command.execute(command, args)).to eq "Found the book at 010101"
      end

      it 'return Book not found! when input not exists' do
         command, *args = 'find_book|8098980989898'.split("|")

         expect(book_command.execute(command, args)).to eq "Book not found!"
      end
   end

   describe ListBookCommand do
      before(:each) do
         first_library.send(:build, 2,1,2)
      end

      it 'return No books at all! when input shelves are empty' do
			command, *args = "list_books".split("|")

         expect(book_command.execute(command, args)).to eq "No books at all!"
		end

      it 'return list of books when input list_books' do
         command, *args = put_book_1.split("|")
         book_command.execute(command, args)

         command, *args = put_book_2.split("|")
         book_command.execute(command, args)

         command, *args = put_book_3.split("|")
         book_command.execute(command, args)

         command, *args = "list_books".split("|")
         
         expect(book_command.execute(command, args)).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling", "020101: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
		end
   end

   describe SearchBookCommand do
      context 'search_by title' do
         it 'return array of string when input books with the similiar title' do
            command, *args = "search_books_by_title|Harry Potter".split("|")
   
            expect(book_command.execute(command, args)).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
         end

         it 'return Book not found! when input not exists' do
            command, *args = "search_books_by_title|lalala".split("|")
   
            expect(book_command.execute(command, args)).to eq "Book not found!"
         end
      end

      context 'search_by author' do
         it 'return array of string when input books with the similiar title' do
            command, *args = "search_books_by_author|Kent Beck".split("|")
   
            expect(book_command.execute(command, args)).to eq ["020101: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
         end

         it 'return Book not found! when input not exists' do
            command, *args = "search_books_by_author|lalala".split("|")
   
            expect(book_command.execute(command, args)).to eq "Book not found!"
         end
      end
   end
end