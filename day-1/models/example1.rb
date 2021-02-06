class Example1
    def transform(input)
        return '' if input == ''
        return (input.ord + 9).chr if input == 'b'
    end
end