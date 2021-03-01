require './library.rb'
require './lib/book.rb'

class Command
   def execute
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
   end


   # def initialize
   #    @book = Book.new
   # end

   # def run
   #    puts "----------------------"
   #    puts "Welcome in Library"
   #    puts "----------------------"
   #    puts ""
   
   #    begin
   #       input = gets.chomp
   #       command, *args = input.split("|")
   
   #       case command
   #       when 'build_library'
   #          execute_build_library(args)
   #       when 'put_book'
   #          execute_put_book(args)
   #       when 'take_book_from'
   #          execute_take_book_from(args)
   #       when 'find_book'
   #          execute_find_book(args)
   #       when 'list_books'
   #          execute_list_books
   #       when 'search_books_by_title'
   #          execute_search_books_by('title',args)
   #       when 'search_books_by_author'
   #          execute_search_books_by('author',args)
   #       end
   #    end while command != 'exit'
   # end
end

