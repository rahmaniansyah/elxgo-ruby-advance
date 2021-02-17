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

    def put_book(isbn, title, author)
        response = "All shelves are full!"
        @shelves.keys.each do |key|
            if @shelves[key].nil?
                @shelves[key] = {"isbn"=>isbn, "title"=>title, "author"=>author}
                response = "Allocated address: #{key}"
                break
            end
        end
        puts @shelves
        return response
    end

    def take_book_from(slot)
        return "Invalid code!" unless @shelves.keys.include?(slot)
        # puts @shelves[slot]
        @shelves[slot] = nil
        # puts @shelves[slot]
        return "Slot #{slot} is free" 
    end

    def find_book(isbn)
        slot = nil
        @shelves.select do |key, shelf| 
            if !shelf.nil? && shelf["isbn"] == isbn
                slot = key
            end
        end
        response = slot.nil? ? "Book not found!" : "Found the book at #{slot}"
        return response
    end

end