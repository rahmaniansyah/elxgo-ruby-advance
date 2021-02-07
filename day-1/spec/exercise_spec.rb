require './models/exercise.rb'

# terdapat input array of integer
# breakdown array menjadi 1 variable
# outputnya integer variable + 1
# rules : tidak negatif

RSpec.describe Exercise do
    context '#incrementing_aoi' do
        it 'returns true when input is integer' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi(5)

            expect(result).to eq true
        end
    end
end