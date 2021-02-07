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
        
        it 'returns k when input b' do
            transformer = Example1.new
            result = transformer.transform('b')

            expect(result).to eq 'k'
        end

        it 'returns p when input u' do
            transformer = Example1.new
            result = transformer.transform('u')

            expect(result).to eq 'p'
        end

        it 'returns i when input z' do
            transformer = Example1.new
            result = transformer.transform('z')

            expect(result).to eq 'i'
        end

        it 'returns z when input e' do
            transformer = Example1.new
            result = transformer.transform('e')

            expect(result).to eq 'z'
        end
    end
end