require './lib/library.rb'
require './lib/book.rb'

begin
   input = gets.chomp
   command, *args = input.split("|")
   
   if command.eql? 'build_library'
      Library.instance.build(args)
   else
      Book.new.execute(command, args)
   end
end while command != 'exit'
