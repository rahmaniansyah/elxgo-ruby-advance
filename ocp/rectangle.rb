class Rectangle
  attr_accessor :name, :length, :width

  def initialize(name, length, width)
    @name = name
    @length = length
    @width = width
  end

  def calculate
    return @width * @length
  end

end
