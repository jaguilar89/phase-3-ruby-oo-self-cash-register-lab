class CashRegister
    attr_writer :items
    attr_accessor :discount, :total, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.items.concat([title] * quantity)
        self.last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if self.discount != 0
            calculated_discount = (self.discount / 100.to_f) * self.total
            self.total = (self.total - calculated_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    
    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
