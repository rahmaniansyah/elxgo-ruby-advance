class Library
    attr_accessor :bookshelves, :rows, :columns

    def initialize(bookshelves, rows, columns)
        @bookshelves = bookshelves
        @rows = rows
        @columns = columns
    end

    def build
        shelves = {}
        for bookshelf in 1..@bookshelves
            for row in 1..@rows
                for column in 1..@columns
                    shelves["0#{bookshelf}0#{row}0#{column}"] = nil
                end
            end
            response = "Shelf #{bookshelf} with #{row} rows and #{columns} columns is added"
            return response 
        end
    end

end