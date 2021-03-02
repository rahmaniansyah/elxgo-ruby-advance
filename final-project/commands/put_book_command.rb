require_relative './command.rb'

class PutBookCommand < Command
   def execute(args)
      library = Library.instance
      response = []
      response = "All shelves are full!"

      library.shelves.keys.each do |key|
         if library.shelves[key].nil?
            library.shelves[key] = {"isbn"=>args[0], "title"=>args[1], "author"=>args[2]}
            response = "Allocated address: #{key}"
            break
         end
      end

      response
   end
end