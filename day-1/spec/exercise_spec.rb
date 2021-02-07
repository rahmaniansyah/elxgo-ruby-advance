require './models/exercise.rb'

# terdapat input array of integer
# breakdown array menjadi 1 variable
# outputnya integer variable + 1
# rules : tidak negatif

RSpec.describe Exercise do
    context '#incrementing_aoi' do
        it 'returns [1] when input []' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([])

            expect(result).to eq [1]
        end

        it 'returns [6] when input is [5]' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([5])

            expect(result).to eq [6]
        end
    end
end