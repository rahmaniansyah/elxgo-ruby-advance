require './models/library.rb'

RSpec.describe Library do
    let(:library) {Library.new(1,1,2)}

    context '#build' do
        it 'return ["Shelf 1 with 1 rows and 2 columns is added"] when params input |1|1|2' do
            # library = Library.new(1,1,2)
            
            expect(library.build).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
        end

        it 'return ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"] when params input |2|1|3' do
            library = Library.new(2,1,3)
            
            expect(library.build).to eq ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"]
        end
    end

    context '#put_book' do
        it 'returns Allocated address: 010101 when input first book' do
            isbn = 123
            title = "title"
            author = "author"
            
            library.build

            expect(library.put_book(isbn,title,author)).to eq "Allocated address: 010101"
        end

        it 'returns Allocated address: 010102 when input second book' do
            isbn = 123
            title = "title"
            author = "author"
            
            library.build
            library.put_book(isbn,title,author)

            expect(library.put_book(isbn,title,author)).to eq "Allocated address: 010102"
        end

        it 'returns All shelves are full! when input third book' do
            isbn = 123
            title = "title"
            author = "author"
            
            library.build
            library.put_book(isbn,title,author)
            library.put_book(isbn,title,author)

            expect(library.put_book(isbn,title,author)).to eq "All shelves are full!"
        end
    end

    context '#take_book_from' do
        it 'returns Slot 010101 is free when input 010101' do
            isbn = 123
            title = "title"
            author = "author"

            library.build
            library.put_book(isbn,title,author)

            expect(library.take_book_from("010101")).to eq "Slot 010101 is free"
        end

        it 'returns Invalid code! when input unexist code' do
            library.build
            expect(library.take_book_from("999")).to eq "Invalid code!"
        end
    end

    context '#find_book' do
        it 'return Found the book at 010101 when input isbn 123' do
            isbn = 123
            title = "title"
            author = "author"

            library.build
            library.put_book(isbn,title,author)

            expect(library.find_book("123")).to eq "Found the book at 010101"
        end
    end
end