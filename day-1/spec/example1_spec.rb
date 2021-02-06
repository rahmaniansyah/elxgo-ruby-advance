require './models/example1.rb'

# buat pengecekan string
# apabila vokal mundur 5 langkah dari alfabet yang lain maju 9 langkah

RSpec.describe Example1 do
    context '#transform' do
        it 'returns empty string when input is empty' do
            transformer = Example1.new
            result = transformer.transform('')

            expect(result).to eq ''
        end
    end
end