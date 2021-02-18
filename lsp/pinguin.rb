require_relative 'bird'

class Pinguin < Bird
  def sound
    "wack"
  end
  
  def fly
    raise "I can't fly"
  end
end
