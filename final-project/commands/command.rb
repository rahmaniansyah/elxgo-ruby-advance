class Command
   def initialize
      @format = WordFormatter.new
   end

   def execute
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
   end
end
