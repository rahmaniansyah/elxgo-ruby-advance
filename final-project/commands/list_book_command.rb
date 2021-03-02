require_relative './command.rb'

class ListBookCommand < Command
   def execute(args)
      library = Library.instance
      responses = []
      library.shelves.select do |key, shelf| 
         if !shelf.nil?
            responses << "#{key}: #{shelf["isbn"]} | #{shelf["title"]} | #{shelf["author"]}"
         end
      end
      return responses.empty? ? "No books at all!" : print(responses)
   end

   private

   def print(responses)
      responses.each {|response| puts response}
   end
end