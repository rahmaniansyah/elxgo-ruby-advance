require_relative './command.rb'

class TakeBookCommand < Command
   def execute(args)
      library = Library.instance
      slot = args[0]
      
      return "Invalid code!" unless library.shelves.keys.include?(slot)
      library.shelves[slot] = nil

      return "Slot #{slot} is free"
   end
end