class CashRegister
    attr_reader :discount, :items
    attr_accessor :total
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prev = 0
    end
    def add_item(title, price, qty=1)
        @total += (qty * price)
        qty.times {@items << title}
        @prev = (qty * price)
    end
    def apply_discount()
        if @discount == 0
            return("There is no discount to apply.")
        end
        @total -= (@total * discount / 100)
        return("After the discount, the total comes to $#{@total}.")
    end
    def void_last_transaction
        @items.pop
        @total -= @prev
    end
end