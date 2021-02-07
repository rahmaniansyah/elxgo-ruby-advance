class Example1
    VOWEL = ['a','i','u','e','o']

    def transform(input)
        if input == ''
            ''
        elsif VOWEL.include?(input)
            ordinal_res = input.ord - 5
            
            if ordinal_res < 'a'.ord
                diff = 'a'.ord - ordinal_res
                ('z'.ord - diff + 1).chr
            else
                ordinal_res.chr
            end
        else
            ordinal_res = input.ord + 9
            
            if ordinal_res > 'z'.ord
                diff = ordinal_res - 'z'.ord
                ('a'.ord + diff - 1).chr
            else
                ordinal_res.chr
            end
        end
    end
end