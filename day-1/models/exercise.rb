class Exercise
    def incrementing_aoi(input)
        if input.empty?
            return [1]
        else
            sum = 0
            input_size = input.size - 1
            input.each do |number|
                sum += number * (10**(input_size))
                input_size -= 1
            end
            result = convert_to_array(sum += 1)
        end
    end

    private

    def convert_to_array(input)
        result = Array.new

        while input > 0
            result.push(input % 10)
            input /= 10
        end
        result.reverse
    end
end