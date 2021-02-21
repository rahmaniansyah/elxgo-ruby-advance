class WordFormatter
   attr_reader :slot, :isbn, :title, :author

   def initialize(slot = nil, isbn = nil, title = nil, author = nil)
      @slot = slot
      @isbn = isbn
      @title = title
      @author = author
   end

   def sentence
      "#{slot}: #{isbn} | #{title} | #{author}"
   end

   def not_found
      "Book not found!"
   end

   def full
      "All shelves are full!"
   end

   def empty
      "No books at all!"
   end
end