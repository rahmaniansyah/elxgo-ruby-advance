require_relative './command.rb'

class FindBookCommand < Command
   def execute(args)
      library = Library.instance
      isbn = args[0]
      slot = nil

      library.shelves.select do |key, shelf| 
         if !shelf.nil? && shelf["isbn"] == isbn
            slot = key
         end
      end
      response = slot.nil? ? "Book not found!" : "Found the book at #{slot}"
   end
end