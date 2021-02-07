require './models/exercise.rb'

# terdapat input array of integer
# breakdown array menjadi 1 variable
# outputnya integer variable + 1
# rules : tidak negatif

RSpec.describe Exercise do
    context '#incrementing_aoi' do
        it 'returns false when input not integer' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi('a')

            expect(result).to eq false
        end

        # it 'returns 54 when input is [5,4]' do
        #     incrementer = Exercise.new
        #     result = incrementer.incrementing_aoi([5,4])

        #     expect(result).to eq 54
        # end
    end
end