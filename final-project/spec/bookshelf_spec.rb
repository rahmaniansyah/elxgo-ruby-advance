require './models/bookshelf.rb'

RSpec.describe Bookshelf do
    context '#generate_shelf_index' do
        it 'return array of string when input bookshelf params id, row, column' do
            bookshelf_params = {"id"=> 1, "row"=> 1, "column"=> 2}
            
            bookshelf = Bookshelf.new
            result = bookshelf.generate_shelf_indexes(bookshelf_params)
            
            expeted_result = ["010101", "010102"]
            expect(result).to eq expeted_result
        end
    end
end