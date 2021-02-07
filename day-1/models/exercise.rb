class Exercise
    def incrementing_aoi(input)
        return true if input.empty?

        array_size = input.size
        input.each do |number|
            result = 0
            if !number.is_a? Integer
                return false
            else
                result += number * (array_size*10)
            end
        end

        result
    end
end