class Library
    attr_reader :bookshelves, :rows, :columns

    def initialize(bookshelves, rows, columns)
        @bookshelves = bookshelves
        @rows = rows
        @columns = columns
        @shelves = {}
    end

    def build
        response = []
        for bookshelf in 1..bookshelves
            for row in 1..rows
                for column in 1..columns
                    @shelves["0#{bookshelf}0#{row}0#{column}"] = nil
                end
            end
            response << "Shelf #{bookshelf} with #{row} rows and #{columns} columns is added"
        end
        return response 
    end

    def put_book
        puts shelves
    end

end