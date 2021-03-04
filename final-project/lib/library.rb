class Library
	attr_accessor :shelves

	def initialize
		@shelves = {}
		@commands = {}
		
	end

	@@instance = Library.new

	def self.instance
		@@instance
	end

	private

	def build(args)
		bookshelves = args[0].to_i
		rows = args[1].to_i
		columns = args[2].to_i

		responses = []
		for bookshelf in 1..bookshelves
			for row in 1..rows
				for column in 1..columns
					@shelves["0#{bookshelf}0#{row}0#{column}"] = nil
				end
			end
			responses << "Shelf #{bookshelf} with #{row} rows and #{columns} columns is added"
		end
		return print(responses) 
	end

	def print(responses)
		responses.each {|response| puts response}
	end
end