class Triangle
  attr_accessor :name, :base, :height

  def initialize(name, base, height)
    @name = name
    @base = base
    @height = height
  end

  def calculate
    return @base * @height * 0.5
  end
end
