require_relative '../commands/put_book_command.rb'
require_relative '../commands/find_book_command.rb'
require_relative '../commands/list_book_command.rb'
require_relative '../commands/take_book_command.rb'
require_relative '../commands/search_book_command.rb'

class Book < Library
   def initialize
      @commands = Hash.new
      @commands['put_book']               = PutBookCommand.new
      @commands['take_book_from']         = TakeBookCommand.new
      @commands['find_book']              = FindBookCommand.new
      @commands['list_books']             = ListBookCommand.new
      @commands['search_books_by_title']  = SearchBookCommand.new
      @commands['search_books_by_author'] = SearchBookCommand.new
   end

   def execute(command, args)
      args << command
      command = @commands[command]
      command.execute(args)
   end
end