# Command class is used as a parent class to do all command
class Command
	def execute
		raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
	end
end
