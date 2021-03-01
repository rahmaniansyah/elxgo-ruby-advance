require './library.rb'
require './lib/word_formatter.rb'

class Book < Library
    def initialize
      @commands = Hash.new
      # @commands['put_book']               = 
      # @commands['take_book_from']         =
      # @commands['find_book']              =
      # @commands['list_books']             =
      # @commands['search_books_by_title']  =
      # @commands['search_books_by_author'] =
    end

    private

   def execute(command, args)
      command = @commands[command]
      command.execute(args)
   end
end