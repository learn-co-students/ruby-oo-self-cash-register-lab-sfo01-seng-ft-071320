require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :price

    def initialize discount = 0
        @total = 0
        @discount = discount
        @items = []
        @cost_and_quantity = []
    end

    def add_item (item, price, quantity = 1)
        price *= quantity
        @total += price
        
        quantity.times do
            @items << item
        end

        @cost_and_quantity << {
            "total_cost" => price,
            "item" => item,
            "quantity" => quantity,
        }
    end


    def apply_discount 
        if total == 0
          return 'There is no discount to apply.'
        end
        @total -= @total * discount/100

        return "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        # scratch out item from cost_and_quantity, write on hand
        last_transaction = @cost_and_quantity.pop()

        # for quantity times, scratch out item
        last_transaction["quantity"].times do
            @items -= [last_transaction["item"]]
        end
        
        # subtract total cost from total
        @total -= last_transaction["total_cost"]
    end







    #def initialize discount = 0
    #   @items = []
    #end

    #def add_item (item, price, quantity = 1)
    #   @items << {
    #        "item" => item,
    #       "price" => price,
    #       "quantity" => quantity,
    #   }
    #end
end
