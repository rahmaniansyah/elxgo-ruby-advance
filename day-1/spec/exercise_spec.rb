
require './models/exercise.rb'
require 'simplecov'
SimpleCov.start

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

        it 'returns [5,6,2] when input is [5,6,1]' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([5,6,1])

            expect(result).to eq [5,6,2]
        end

        it 'returns [1,0,0] when input is [9,9]' do
            incrementer = Exercise.new
            result = incrementer.incrementing_aoi([9,9])

            expect(result).to eq [1,0,0]
        end
    end
end