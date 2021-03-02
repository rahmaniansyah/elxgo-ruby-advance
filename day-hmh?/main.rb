class OrderService
   def self.create_service(command)
      case command
      when 'goride'
         GoRide.new
      when 'gofood'
         GoFood.new
      when 'gopulsa'
         GoPulsa.new
      end
   end

   def order
      raise NotImplementedError
   end
end

class GoRide < OrderService
   def order(order_details)
      
   end
end

class GoPulsa
   def order(order_details)
      
   end
end

class GoFood
   def order(order_details)
      
   end
end

input = gets.chomp
command, *args = input.split(" ")

service = OrderService.create_service(command)
service.order(args)
