require './lib/library.rb'

class Book < Library
    attr_reader :isbn, :title, :author

    def initialize(isbn = nil, title = nil, author = nil)
        @isbn = isbn
        @title = title
        @author = author
    end

   def all
      response = []
      @@shelves.select do |key, shelf| 
          if !shelf.nil?
              response << generate_wording(key, shelf["isbn"], shelf["title"], shelf["author"])
          end
      end
      return response.empty? ? "No books at all!" : response
   end

    def put_book
        response = "All shelves are full!"
        @@shelves.keys.each do |key|
            if @@shelves[key].nil?
                @@shelves[key] = {"isbn"=>isbn, "title"=>title, "author"=>author}
                response = "Allocated address: #{key}"
                break
            end
        end
        response
    end

   def find_book
      slot = nil
      @@shelves.select do |key, shelf| 
         if !shelf.nil? && shelf["isbn"] == isbn
            slot = key
         end
      end
      response = slot.nil? ? "Book not found!" : "Found the book at #{slot}"
   end

   def search_books_by(type, params)
      response = []
      @@shelves.select do |key, shelf| 
         if !shelf.nil? && shelf[type].include?(params)
               response << generate_wording(key, shelf["isbn"], shelf["title"], shelf["author"])
         end
      end
      return response.empty? ? "Book not found!" : response
   end

   def generate_wording(key, isbn, title, author)
      "#{key}: #{isbn} | #{title} | #{author}"
   end
end