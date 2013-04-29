class Item
    #This class represents the items,their prices and any discounts/offers available
    attr_accessor :price, :bogof, :multiplier, :discount_price, :item_count
    
    def initialize(price = nil,bogof = nil ,multi = nil,discounted = nil)
    
        #do some type checking as we don't want to build an erroneous 
        #object
        @price = nil
        @bogof = nil
        @multiplier = nil
        @discount_price = nil
        @item_count = 0
        if price.is_a? Numeric
            @price = price
        end
        if (bogof.is_a? Numeric)
            if bogof < 2 && bogof >= 0
                @bogof = bogof
            end
        end
        if multi.is_a? Numeric
            @multiplier = multi
        end
        if discounted.is_a? Numeric
            @discount_price = discounted
        end
    end
    
    def increment_item_count
        @item_count+=1
    end
    
    def decrement_item_count
        @item_count-=1
    end
    
    def clear_item_count
        @item_count = 0
    end
    
    def get_item_count
        return item_count
    end
    
    def set_price(price)
        if price.is_a? Numeric
            @price = price
        end
    end
    
    def get_price
        if @item_count >= @multiplier && multiplier != 0
            return @discount_price
        else
            return @price
        end
    end
    
    def set_bogof(bogof)
        if (bogof.is_a? Numeric) && bogof < 2 && bogof >= 0
            @bogof = bogof
        end
    end
    
    def get_bogof
        return bogof
    end
    
    def set_multiplier(multi)
        if multi.is_a? Numeric
            @multiplier = multi
        end
    end
    
    def get_multiplier
        return @multiplier
    end
    
    def set_discount(price)
        if price.is_a? Numeric
            @discount_price = price
        end
    end
    
    def get_discount
        return @discount_price
    end
    

end