require './keyboard_reader'
require './scanner'
require './printer'

class Copier
	def copy(input)
		# reader = KeyboardReader.new
		# writer = Printer.new

		# reader.read(input)
		# writer.write(input, reader.name)
	end

	def do_read_for(tools)
		something.read
	end

	def do_print_for(tools)
		something.print
	end

	def do_write_for(tools)
		something.write
	end
end
