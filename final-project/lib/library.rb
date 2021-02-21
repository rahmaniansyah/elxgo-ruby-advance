class Library
    attr_reader :bookshelves, :rows, :columns

    def initialize(bookshelves, rows, columns)
        @bookshelves = bookshelves
        @rows = rows
        @columns = columns
        @@shelves = {}
    end

    def build
        response = []
        for bookshelf in 1..bookshelves
            for row in 1..rows
                for column in 1..columns
                    @@shelves["0#{bookshelf}0#{row}0#{column}"] = nil
                end
            end
            response << "Shelf #{bookshelf} with #{row} rows and #{columns} columns is added"
        end
        return response 
    end

    def take_book_from(slot)
        return "Invalid code!" unless @@shelves.keys.include?(slot)
        @@shelves[slot] = nil
        return "Slot #{slot} is free" 
    end

    def list_books
        response = []
        @@shelves.select do |key, shelf| 
            if !shelf.nil?
                response << generate_wording(key, shelf["isbn"], shelf["title"], shelf["author"])
            end
        end
        return response.empty? ? "No books at all!" : response
    end

    # def search_books_by(type, params)
    #     response = []
    #     @shelves.select do |key, shelf| 
    #         if !shelf.nil? && shelf[type].include?(params)
    #             response << generate_wording(key, shelf["isbn"], shelf["title"], shelf["author"])
    #         end
    #     end
    #     return response.empty? ? "Book not found!" : response
    # end

    def generate_wording(key, isbn, title, author)
        "#{key}: #{isbn} | #{title} | #{author}"
    end

end