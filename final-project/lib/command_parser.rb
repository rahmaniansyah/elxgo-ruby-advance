require './lib/library.rb'
require './lib/book.rb'

class CommandParser

   def run
      puts "----------------------"
      puts "Welcome in Library"
      puts "----------------------"
      puts ""
   
      begin
         input = gets.chomp
         command, *args = input.split("|")
   
         case command
         when 'build_library'
            execute_build_library(args)
         when 'put_book'
            execute_put_book(args)
         when 'take_book_from'
            execute_take_book_from(args)
         when 'find_book'
            execute_find_book(args)
         when 'list_books'
            execute_list_books
         when 'search_books_by_title'
            execute_search_books_by_title(args)
         when 'search_books_by_author'
            execute_search_books_by_author(args)
         end
      end while command != 'exit'
   end

   def execute_build_library(args)
      bookshelves = args[0].to_i
      rows = args[1].to_i
      columns = args[2].to_i
      
      library = Library.new(bookshelves,rows,columns)
      libraries = library.build
      
      libraries.each {|library| puts library}
   end

   def execute_put_book(args)
      isbn = args[0]
      title = args[1]
      author = args[2]

      book = Book.new(isbn,title,author)
      response = book.put_book
      puts response
   end

   def execute_take_book_from(args)
      
   end

   def execute_find_book(args)
      isbn = args[0]
      book = Book.new(isbn)
      response = book.find_book

      puts response
   end

   def execute_list_books
      book = Book.new
      response = book.all

      puts response
   end
end