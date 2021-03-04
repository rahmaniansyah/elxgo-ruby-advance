require_relative './command.rb'

class TakeBookCommand < Command
	def execute(args)
		library = Library.instance
		slot = args[0]
		
		unless library.shelves.keys.include?(slot)
			response = "Invalid code!"
		else
			library.shelves[slot] = nil
			response = "Slot #{slot} is free"
		end

		# return response = "Invalid code!" unless library.shelves.keys.include?(slot)
		# library.shelves[slot] = nil

		print(response)
		return response
	end

	private
	
	def print(response)
		puts response
	end
end