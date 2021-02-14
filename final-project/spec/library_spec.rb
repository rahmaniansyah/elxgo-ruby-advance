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


        end
    end
end