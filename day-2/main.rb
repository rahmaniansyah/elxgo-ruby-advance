require 'sinatra'
require './models/fruit.rb'

class Main
    def my_fruit(name)
        return Fruit.nutrition if name == "apple"
        Fruit.new.calculate_nutrition
    end
end