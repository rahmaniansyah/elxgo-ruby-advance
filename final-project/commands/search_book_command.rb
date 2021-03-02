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
      puts responses.empty?
      # responses.empty? ? "Book not found!" : print(responses)

      if responses.empty?
         responses = "Book not found!"
         puts responses
      else
         print(responses)
      end
      return responses
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