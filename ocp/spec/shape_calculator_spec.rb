require './rectangle'
require './triangle'
require './shape_calculator'

describe ShapeCalculator do 
  it "can calculate the area of a rectangle" do
    rectangle = Rectangle.new("rectangle", 2, 3)
    shape_calculator = ShapeCalculator.new
    expect(shape_calculator.calculate_area(rectangle)).to eq(6)
  end

  it "can calculate the area of a triangle" do
    triangle = Triangle.new("triangle", 2, 3)
    shape_calculator = ShapeCalculator.new
    expect(shape_calculator.calculate_area(triangle)).to eq(3)
  end
end
