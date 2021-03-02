require_relative './command.rb'

class SearchBookCommand < Command
   def execute(args)
      library = Library.instance
      type = search_by(args.last)
      params = args[0]
      
      responses = []
      library.shelves.select do |key, shelf| 
         if !shelf.nil? && shelf[type].include?(params)
            responses << "#{key}: #{shelf["isbn"]} | #{shelf["title"]} | #{shelf["author"]}"
         end
      end
      return responses.empty? ? "Book not found!" : print(responses)
   end

   private

   def search_by(command)
      args = command.split('_')
      args.last
   end

   def print(responses)
      responses.each {|response| puts response}
   end
end