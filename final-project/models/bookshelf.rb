class Bookshelf

    attr_accessor :book_ids, :rows, :columns

    def initialize(book_ids = nil, rows = nil, columns = nil)
        @book_ids = book_ids
        @rows = rows
        @columns = columns
    end

    def generate_shelf_indexes(book_ids, rows, columns)
        shelf_indexes = Array.new
            for book_id in 1..book_ids
                for row in 1..rows
                    for column in 1..columns
                        shelf_indexes.push("0#{book_id}0#{row}0#{column}")
                    end
                end
            end
        shelf_indexes
    end

    def self.build
        indexes = generate_shelf_indexes(@book_ids, @rows, @columns)
        shelves = {}
        indexes.inject({}) do |hash, index|
            hash[index] = nil
            shelves = hash
        end
        shelves
        puts 'tes'
        puts 'tes'
        if shelves.size == @book_ids*@rows*@columns
            for book_id in 1..@book_ids
                return "Shelf #{@book_id} with #{@rows} rows and #{@columns} columns is added"
            end
        end
    end
end