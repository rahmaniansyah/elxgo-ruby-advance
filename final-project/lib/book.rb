require './lib/library.rb'
require './lib/word_formatter.rb'

class Book < Library
    attr_reader :isbn, :title, :author

    def initialize(isbn = nil, title = nil, author = nil)
        @isbn = isbn
        @title = title
        @author = author
        @format = WordFormatter.new
    end

   def all
      response = []
      @@shelves.select do |key, shelf| 
         if !shelf.nil?
            new_format = WordFormatter.new(key, shelf["isbn"], shelf["title"], shelf["author"])
            response << new_format.sentence
         end
      end
      return response.empty? ? @format.empty : response
   end

    def put_book
        response = @format.full
        @@shelves.keys.each do |key|
            if @@shelves[key].nil?
               @@shelves[key] = {"isbn"=>isbn, "title"=>title, "author"=>author}
               response = "Allocated address: #{key}"
               break
            end
        end
        response
    end

   def find_book
      slot = nil
      @@shelves.select do |key, shelf| 
         if !shelf.nil? && shelf["isbn"] == isbn
            slot = key
         end
      end
      response = slot.nil? ? @format.not_found : "Found the book at #{slot}"
   end

   def search_books_by(type, params)
      response = []
      @@shelves.select do |key, shelf| 
         if !shelf.nil? && shelf[type].include?(params)
            new_format = WordFormatter.new(key, shelf["isbn"], shelf["title"], shelf["author"])
            response << new_format.sentence
         end
      end
      return response.empty? ? @format.not_found : response
   end

   def delete_by_slot(slot)
      return "Invalid code!" unless @@shelves.keys.include?(slot)
      @@shelves[slot] = nil
      return "Slot #{slot} is free" 
   end
end