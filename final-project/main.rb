require './lib/library.rb'
require './lib/book.rb'
require 'byebug'

begin
   input = gets.chomp
   command, *args = input.split("|")
   
   # byebug
   if command.eql? 'build_library'
      Library.instance.send(:build, args)
   elsif ['put_book', 'take_book_from', 
         'find_book', 'list_books', 
         'search_books_by_title', 
         'search_books_by_author'].include? command
      Book.new.execute(command, args)
   end
end while command != 'exit'
