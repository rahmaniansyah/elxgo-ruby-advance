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
      
      if slot.nil?
         response = "Book not found!"
      else
         response = "Found the book at #{slot}"
      end
      
      print(response)
      return response
   end

   private
   
   def print(response)
      puts response
   end
end