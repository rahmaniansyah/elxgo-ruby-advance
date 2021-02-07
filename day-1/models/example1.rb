class Example1
    VOWEL = ['a','i','u','e','o']

    def transform(input)
        if input == ''
            ''
        elsif VOWEL.include?(input)
            return (input.ord - 5).chr
        else
            if input.ord + 9 > 'z'.ord
                diff = input.ord + 9 - 'z'.ord
                ('a'.ord + diff - 1).chr
            else
                (input.ord + 9).chr
            end
        end
    end
end