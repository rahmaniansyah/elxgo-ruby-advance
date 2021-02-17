require './models/library.rb'

RSpec.describe Library do
    let(:first_library) {Library.new(1,1,2)}
    let(:second_library) {Library.new(2,1,3)}

    let(:isbn1) { "9780747532743" }
    let(:title1) { "Harry Potter 1" }
    let(:author1) { "J. K. Rowling" }

    let(:isbn2) { "9780201485677" }
    let(:title2) { "Refactoring" }
    let(:author2) { "Martin Fowler, Kent Beck" }

    let(:isbn3) { "9780807281918" }
    let(:title3) { "Harry Potter 2" }
    let(:author3) { "J. K. Rowling" }

    context '#build' do
        it 'return ["Shelf 1 with 1 rows and 2 columns is added"] when params input |1|1|2' do
            expect(first_library.build).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
        end

        it 'return ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"] when params input |2|1|3' do
            expect(second_library.build).to eq ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"]
        end
    end

    context '#put_book' do
        it 'returns Allocated address: 010101 when input first book' do
            first_library.build

            expect(first_library.put_book(isbn1,title1,author1)).to eq "Allocated address: 010101"
        end

        it 'returns Allocated address: 010102 when input second book' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)

            expect(first_library.put_book(isbn2,title2,author2)).to eq "Allocated address: 010102"
        end

        it 'returns All shelves are full! when input third book' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)
            first_library.put_book(isbn2,title2,author2)

            expect(first_library.put_book(isbn1,title1,author1)).to eq "All shelves are full!"
        end
    end

    context '#take_book_from' do
        it 'returns Slot 010101 is free when input 010101' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)

            expect(first_library.take_book_from("010101")).to eq "Slot 010101 is free"
        end

        it 'returns Invalid code! when input unexist code' do
            first_library.build
            expect(first_library.take_book_from("999")).to eq "Invalid code!"
        end
    end

    context '#find_book' do
        it 'return Found the book at 010101 when input isbn 123' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)

            expect(first_library.find_book("9780747532743")).to eq "Found the book at 010101"
        end

        it 'return Book not found! when input not exists' do
            first_library.build

            expect(first_library.find_book("123")).to eq "Book not found!"
        end
    end

    context '#list_books' do
        it 'return list of books when input list_books' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)
            first_library.put_book(isbn2,title2,author2)

            expect(first_library.list_books).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
        end

        it 'return No books at all! when input shelves are empty' do
            first_library.build

            expect(first_library.list_books).to eq "No books at all!"
        end
    end

    context '#search_books_by_title' do
        it 'return 010101: 9780747532743 | Harry Potter 1 | J. K. Rowling when input Harry Potter' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)

            expect(first_library.search_books_by_title("Harry Potter")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling"]
        end

        it 'return array of string when input books with the similiar title' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)
            first_library.put_book(isbn3,title3,author3)

            expect(first_library.search_books_by_title("Harry Potter")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
        end

        it 'return Book not found! when input not exists' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)

            expect(first_library.search_books_by_title("Childern's life")).to eq "Book not found!"
        end
    end

    context '#search_books_by_author' do
        it 'return books when input existing author name' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)
            first_library.put_book(isbn2,title2,author2)

            expect(first_library.search_books_by_author("Kent Beck")).to eq ["010102: 9780201485677 | Refactoring | Martin Fowler, Kent Beck"]
        end

        it 'return array of string when input books with the similiar author name' do
            first_library.build
            first_library.put_book(isbn1,title1,author1)
            first_library.put_book(isbn3,title3,author3)

            expect(first_library.search_books_by_author("Rowling")).to eq ["010101: 9780747532743 | Harry Potter 1 | J. K. Rowling", "010102: 9780807281918 | Harry Potter 2 | J. K. Rowling"]
        end
    end
end