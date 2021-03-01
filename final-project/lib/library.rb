class Library
   def initialize
      @@shelves = {}
   end

   @@instance = Library.new

   def self.instance
      @@instance
   end

   private

   def build(bookshelves = nil, rows = nil, columns = nil)
      response = []
      for bookshelf in 1..bookshelves
         for row in 1..rows
               for column in 1..columns
                  @@shelves["0#{bookshelf}0#{row}0#{column}"] = nil
               end
         end
         response << "Shelf #{bookshelf} with #{row} rows and #{columns} columns is added"
      end
      return response 
   end

   # private_class_method :new
end