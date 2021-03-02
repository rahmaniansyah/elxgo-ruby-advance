class WordFormatter
   def sentence(slot, isbn, title, author)
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