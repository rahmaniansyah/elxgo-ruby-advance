class Printer
   def initialize
      @commands = {}
      @commands["single_page"] = SinglePageCommand.new
      @commands["multiple_pages"] = MultiplePagesCommand.new
      @commands["range"] = RangeCommand.new
   end

   def execute(command, args)
      command = @commands[command]
      command.execute(args)
   end
end

class Command
   def execute(args)
      raise NotImplementedError
   end
end

class SinglePageCommand < Command
   def execute(args)
      puts "printing #{args[0]}"
   end
end

class MultiplePagesCommand < Command
   def execute(args)
      pages = args[0].split(',')
      pages.each {|page| puts "Printin page #{page}"}
   end
end

class RangeCommand < Command
   def execute(args)
      pages = args[0].split('-')
      first_page = pages[0]
      last_page = pages[1]
      
      for page in first_page..last_page
         puts "Printin page #{page}"
      end
   end
end

input = gets.chomp
command, *args = input.split(" ")
printer = Printer.new 
printer.execute(command, args)
