require './models/library.rb'

RSpec.describe Library do
    let(:library) {Library.new(2,1,3)}

    context '#build' do
        it 'return ["Shelf 1 with 1 rows and 2 columns is added"] when params input |1|1|2' do
            library = Library.new(1,1,2)
            
            expect(library.build).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
        end

        it 'return ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"] when params input |2|1|3' do
            # library = Library.new(2,1,3)
            
            expect(library.build).to eq ["Shelf 1 with 1 rows and 3 columns is added", "Shelf 2 with 1 rows and 3 columns is added"]
        end
    end

    context '#put_book' do
        it 'returns Allocated address: 010101 when input put_book|123|title|author' do
            isbn = 123
            title = "title"
            author = "author"
            
            library.build

            expect(library.put_book(isbn,title,author)).to eq "Allocated address: 010101"
        end

        it 'returns Allocated address: 010102 when input put_book|123|title|author' do
            isbn = 123
            title = "title"
            author = "author"
            
            library.build
            library.put_book(isbn,title,author)

            expect(library.put_book(isbn,title,author)).to eq "Allocated address: 010102"
        end
    end
end