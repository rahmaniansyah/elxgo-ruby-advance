require './lib/book.rb'
require './lib/library.rb'

RSpec.describe Book do
    let(:isbn1) { "9780747532743" }
    let(:title1) { "Harry Potter 1" }
    let(:author1) { "J. K. Rowling" }

    let(:first_library) {Library.new(1,1,2)}
    let(:book) { Book.new(isbn1,title1,author1) }

    before(:all) do
        Library.new(1,1,2).build
    end
    
    describe '#put' do
        it 'return' do
            first_library.build
            expect(book.put).to eq true
        end
    end
end