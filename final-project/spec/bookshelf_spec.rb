require './models/bookshelf.rb'

RSpec.describe Bookshelf do
    context '#generate_shelf_index' do
        it 'return ["010101", "010102"] when input 1,1,2' do
            bookshelf = Bookshelf.new
            result = bookshelf.generate_shelf_indexes(1,1,2)
            
            expeted_result = ["010101", "010102"]
            expect(result).to eq expeted_result
        end

        it 'return ["010101", "010102", "020101", "020102"] when input 2,1,2' do
            bookshelf = Bookshelf.new
            result = bookshelf.generate_shelf_indexes(2,1,2)
            
            expeted_result = ["010101", "010102", "020101", "020102"]
            expect(result).to eq expeted_result
        end
    end
    
    # let(:bookshelf) { Bookshelf.new(1,1,2) }

    context '.build' do
        it 'return Shelf 1 with 1 rows and 2 columns is added when input build_library|1|1|2' do
            allow(Bookshelf).to receive(:build).and_return("Shelf 1 with 1 rows and 2 columns is added")
            expect(described_class.new(1,1,2)).to eq "Shelf 1 with 1 rows and 2 columns is added"
        end
    end

    
end