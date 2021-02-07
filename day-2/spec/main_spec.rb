require './main.rb'

RSpec.describe Main do
   describe '#my_fruit' do
    context 'given apple' do
        it 'return i am nutrition' do
            # line ini menjadi acuan yang dihasil kan oleh class yang dipanggil
            allow(Fruit).to receive(:nutrition).and_return('i am ss')       # ini adalah mock               
            expect(described_class.new.my_fruit('apple')).to eq 'i am ss'
        end
    end

    context 'non apple' do
        it 'return i am calculator' do
            # line ini menjadi acuan yang dihasil kan oleh class yang dipanggil
            allow_any_instance_of(Fruit).to receive(:calculate_nutrition).and_return('i am calculator')       # ini adalah mock               
            expect(described_class.new.my_fruit('grape')).to eq 'i am calculator'
        end
    endgit
   end 
end