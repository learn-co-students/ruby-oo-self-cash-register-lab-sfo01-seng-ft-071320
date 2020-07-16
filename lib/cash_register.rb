require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize(discount = 0) #(discount=0 inside the parameter is an optional variable setter)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do 
            @items.push(title)
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        @total = total - (total * discount / 100)
        if @discount != 0
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - last_transaction
    end
end