class Exercise
    def incrementing_aoi(input)
        if input.empty?
            return [1]
        else
            result = Array.new
            sum = 0
            input_size = input.size - 1
            input.each do |number|
                sum += number * (10**(input_size))
                input_size -= 1
            end
            sum += 1
            while sum > 0
                result << sum % 10
                sum /= 10
            end
            result.reverse
        end
    end
end