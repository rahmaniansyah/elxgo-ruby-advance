require './models/exercise.rb'

# terdapat input array of integer
# breakdown array menjadi 1 variable
# outputnya integer variable + 1
# rules : tidak negatif

RSpec.describe Exercise do
    context '#incrementing_aoi' do
        it 'returns true when input []' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([])

            expect(result).to eq true
        end

        it 'returns 55 when input is [5,4]' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([5,4])

            expect(result).to eq 55
        end
    end
end