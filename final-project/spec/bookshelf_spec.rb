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

    # context '#build' do
    #     it 'return Shelf 1 with 1 rows and 2 columns is added when input build_library|1|1|2' do
    #         input_user = "build_library|2|1|3"
            
    #         shelf_indexes = ["010101", "010102"]
    #         bookshelf = Bookshelf.new
            
    #         expect(shelf_indexes.bookshelf.build).to eq "Shelf 1 with 1 rows and 3 columns is added"
    #     end
    # end
end