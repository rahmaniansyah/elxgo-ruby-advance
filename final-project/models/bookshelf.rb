class Bookshelf

    attr_accessor :book_ids, :rows, :columns

    def initialize(book_ids = nil, rows = nil, columns = nil)
        @book_ids = book_ids
        @rows = rows
        @columns = columns
    end

    def generate_shelf_indexes(book_ids, rows, columns)
        shelf_indexes = Array.new
            for row in 1..rows
                for column in 1..columns
                    shelf_indexes.push("0#{book_ids}0#{row}0#{column}")
                end
            end
        shelf_indexes
    end

    # def self.build
    #     indexes = generate_shelf_indexes(book_ids, rows, columns)
    #     shelves = {}
    #     indexes.inject({}) do |hash, index|
    #         hash[index] = nil
    #         shelves = hash
    #     end
    #     shelves
        
    #     if shelves.size == book_ids*rows*columns
    #         for book_id in 1..book_ids
    #             puts "Shelf #{book_id} with #{rows} rows and #{columns} columns is added"
    #         end
    #     end
    # end
end