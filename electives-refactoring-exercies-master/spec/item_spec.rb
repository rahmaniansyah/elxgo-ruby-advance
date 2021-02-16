RSpec.describe Refactoring::Item do
    subject { described_class.new(type, name, price, stock, tags) }
    let(:type) { 'BOOK' }
    let(:name) { 'Apapapun' }
    let(:price) { '10000' }
    let(:stock) { 'BOOK' }
    let(:tags) { 'children' }

    describe '#tax_in_percent' do

        it 'return 10 when type is BOOKS' do
            expect(subject.tax_in_percent).to eq 10
        end
    end
end