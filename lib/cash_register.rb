# require 'pry'

class CashRegister
 attr_accessor :discount, :total, :items, :cost_quant
 attr_reader

 def initialize(discount = 0)
     @total = 0
     @discount = discount
     @items = []
 end

 def add_item(item, cost, quantity = 1)
     self.cost_quant = cost * quantity
     self.total += self.cost_quant
     quantity.times { self.items << item }
 end

 def apply_discount
     if self.discount != 0
         self.total = (((100.0 - self.discount.to_f) / 100) * self.total).to_i
         "After the discount, the total comes to $#{self.total}."
     else
         "There is no discount to apply."
     end
 end

 def void_last_transaction
     self.total -= self.cost_quant
 end    
end

# what we want to do 
# cash_register = CashRegister.new(20)
# cash_register.add_item("book", 50.00, 3)
# cash_register.add_item("book", 50.00, 3)
# cash_register.apply_discount
# # expect total to increased to 15.00 (5 * 3)
# puts cash_register.total

# binding.pry