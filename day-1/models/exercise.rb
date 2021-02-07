class Exercise
    def incrementing_aoi(input)
        return true if input.empty?

        array_size = input.size
        result = 0
        input.each do |number|
            if !number.is_a? Integer
                return false
            else
                result += number * (10**(array_size-1))
                array_size -= 1
            end
        end

        result
    end
end