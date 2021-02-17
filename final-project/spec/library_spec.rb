require './models/library.rb'

RSpec.describe Library do
    let(:first_library) {Library.new(1,1,2)}
    let(:second_library) {Library.new(2,1,3)}

    let(:isbn) { "123" }
    let(:title) { "title" }
    let(:author) { "author" }

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

            expect(first_library.put_book(isbn,title,author)).to eq "Allocated address: 010101"
        end

        it 'returns Allocated address: 010102 when input second book' do
            first_library.build
            first_library.put_book(isbn,title,author)

            expect(first_library.put_book(isbn,title,author)).to eq "Allocated address: 010102"
        end

        it 'returns All shelves are full! when input third book' do
            first_library.build
            first_library.put_book(isbn,title,author)
            first_library.put_book(isbn,title,author)

            expect(first_library.put_book(isbn,title,author)).to eq "All shelves are full!"
        end
    end

    context '#take_book_from' do
        it 'returns Slot 010101 is free when input 010101' do
            first_library.build
            first_library.put_book(isbn,title,author)

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
            first_library.put_book(isbn,title,author)

            expect(first_library.find_book("123")).to eq "Found the book at 010101"
        end

        it 'return Book not found! when input not exists' do
            first_library.build

            expect(first_library.find_book("123")).to eq "Book not found!"
        end
    end

    context '#list_books' do
        it 'return list of books when input list_books' do
            first_library.build
            first_library.put_book(isbn,title,author)
            first_library.put_book(isbn,title,author)

            expect(first_library.list_books).to eq ["010101: 123 | title | author", "010102: 123 | title | author"]
        end
    end
end