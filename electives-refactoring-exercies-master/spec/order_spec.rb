RSpec.describe Refactoring::Order do
    subject { described_class.new(order_items, quantity, voucher, tax, delivery_cost) }
    let(:order_items) { "type" => "BOOK", "name" => "children's life", "price" => "10000", "stock" => "1", "tags" => "children" }
    let(:quantity) { 1 }
    let(:voucher) { 1 }

    describe '#calculate_price' do

        it '' do
            
        end
    end
end
