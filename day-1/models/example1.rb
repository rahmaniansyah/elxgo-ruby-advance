class Example1
    VOWEL = ['a','i','u','e','o']

    def transform(input)
        result = ''
        input.each_char do |character|
            if character == ''
                result << ''
            elsif VOWEL.include?(character)
                result << transform_vowel(character)
            else
                result << transform_consonant(character)
            end
        end
        result
    end

    private

    def transform_consonant(input)
        ordinal_res = input.ord + 9
        if ordinal_res > 'z'.ord
            diff = ordinal_res - 'z'.ord
            ('a'.ord + diff - 1).chr
        else
            ordinal_res.chr
        end
    end

    def transform_vowel(input)
        ordinal_res = input.ord - 5
        if ordinal_res < 'a'.ord
            diff = 'a'.ord - ordinal_res
            ('z'.ord - diff + 1).chr
        else
            ordinal_res.chr
        end
    end
end