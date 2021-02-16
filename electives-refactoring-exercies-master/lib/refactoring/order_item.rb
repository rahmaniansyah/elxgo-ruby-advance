module Refactoring
  class OrderItem
    attr_reader :item, :quantity
    
    def initialize(item, quantity)
      @item = Item.new(item)
      @quantity = @quantity
    end
  end
end
