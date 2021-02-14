require './models/library.rb'

RSpec.describe Library do
    context '#build' do
        it 'return Shelf 1 with 1 rows and 2 columns is added when params input |1|1|2' do
            library = Library.new(1,1,2)
            
            expect(library.build).to eq ["Shelf 1 with 1 rows and 2 columns is added"]
        end

        it 'return Shelf 1 with 1 rows and 3 columns is added \nShelf 2 with 1 rows and 3 columns is added when params input |2|1|3' do
            library = Library.new(2,1,3)
            
            expect(library.build).to eq 'Shelf 1 with 1 rows and 2 columns is added'
        end
    end
end