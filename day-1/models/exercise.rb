class Exercise
    def incrementing_aoi(input)
        if input.empty?
            return [1]
        end
        # if input.empty?
        #     return 1
        # else
        #     array_size = input.size - 1
        #     result = 0
        #     input.each do |number|
        #         if !number.is_a? Integer
        #             return false
        #         else
        #             result += number * (10**(array_size))
        #             array_size -= 1
        #         end
        #     end
        #     result += 1
        #     fix_res = Array.new
        #     array_size = input.size - 2
        #     result.each do |number|
        #         if number / (10**(array_size))
        #             fix_res.push(number / (10**(array_size)))
        #         end
        #     end
        # end

        # return fix_res
    end
end