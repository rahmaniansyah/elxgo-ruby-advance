class GojekApp
   def pay_order(account, deduction)
       if !account.is_a?(GopayAccount)
           puts "cannot pay order using other payment account"
       else
           remaining_balance = account.balance - deduction
           puts "Order paid using Gopay account. Remaining balance is #{remaining_balance} #{account.currency}"
       end
   end
end

class GopayAccount
   attr_reader :currency, :balance
   def initialize(balance, currency)
       @balance = balance
       @currency = currency
   end
end

class PaymepayAccount
   attr_reader :balance
   def initialize(balance)
       @balance = balance
   end
end

class PaymepayToGopayAdapter
   def parse(paymepay, country)
      currency_balance, currency = calculate_balance(paymepay.balance, country)
      GopayAccount.new(currency_balance, currency)
   end

   private

   def calculate_balance(paymepay, country)
      case country
      when 'indonesia'
         return paymepay * 14000 , 'IDR'
      when 'vietnam'
         return paymepay * 14000 , 'IDR'
      when 'thailand'
         return paymepay * 14000 , 'IDR'
      when 'singapore'
         return paymepay * 14000 , 'IDR'
      end
   end   

end

input = gets.chomp
*args = input.split(" ")

paymepay_balance = args[0].to_i
country = args[1]
deduction = args[2].to_i
gojek_app = GojekApp.new
paymepay_account = PaymepayAccount.new(paymepay_balance)

convert_to_gopay = PaymepayToGopayAdapter.new

paymepay_account = convert_to_gopay.parse(paymepay_account, country)


gojek_app.pay_order(paymepay_account, deduction)
