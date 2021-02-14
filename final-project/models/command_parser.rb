require './models/library.rb'

class CommandParser

    def run
        puts "----------------------"
        puts "Welcome in Library"
        puts "----------------------"
    
        begin
            input = gets.chomp
            command, *args = input.split("|")
    
            case command
            when 'build_library'
                bookshelves = args[0].to_i
                rows = args[1].to_i
                columns = args[2].to_i
                
                library = Library.new(bookshelves,rows,columns)
                libraries = library.build
                
                libraries.each {|library| puts library}
            when 'put_book'
                puts 'put_book'
            when 'take_book_form'
                puts 'take_book_form'
            when 'find_book'
                puts 'find_book'
            when 'list_books'
                puts 'list_books'
            when 'search_books_by_title'
                puts 'search_books_by_title'
            when 'search_books_by_author'
                puts 'search_books_by_author'
            else
                puts 'sorry incorrect command'
            end
        end while command != 'exit'
    end
end