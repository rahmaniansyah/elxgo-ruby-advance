require './lib/library.rb'
require './lib/book.rb'

class CommandParser
   def initialize
      @book = Book.new
   end

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
            execute_search_books_by('title',args)
         when 'search_books_by_author'
            execute_search_books_by('author',args)
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

      new_book = Book.new(isbn,title,author)
      response = new_book.put_book

      puts response
   end

   def execute_take_book_from(args)
      slot = args[0]

      response = @book.delete_by_slot(slot)

      puts response
   end

   def execute_find_book(args)
      isbn = args[0]
      book = Book.new(isbn)
      response = book.find_book

      puts response
   end

   def execute_list_books
      response = @book.all

      puts response
   end

   def execute_search_books_by(type,args)
      params = args[0]

      responses = @book.search_books_by(type, params)

      responses.each {|response| puts response}
   end
end