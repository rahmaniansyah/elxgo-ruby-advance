class Logger
   def initialize
      filename = 'log.txt'
      @file = File.open(filename, 'w')
   end

   @@instance = Logger.new

   def self.instance
      @@instance      
   end

   def write_log(log)
      @file.puts log
   end

   private_class_method :new
end


begin
   log = gets.chomp
   Logger.instance.write_log(log)
end while log != ''