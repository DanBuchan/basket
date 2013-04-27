class Checkout
    #This class compiles bills
    
    require_relative './pricing_rules'
    attr_accessor :pricing
    
    def initialize(pricing)
        #set the pricing rules, takes an instance of pricing_rules
        #initialize and empty set of scanned items
        @pricing = nil
        @total_price = 0
        if pricing.is_a? PricingRules
            @pricing = pricing
        end
    end
    
    def scan(item)
        #increments item count for each item type
        #should test for existance of the item type label
        item.downcase!
        
        if PricingRules.method_defined? item
            @pricing.send(item).increment_item_count
        else
            return 0
        end
    end
    
    def total
        #loops over the scanned item set and applies the pricing rules
        #returns the total price
        items = pricing.instance_variables;
        items.each do |it|
            inst_var = it.to_s
            inst_var.gsub!(/@/,'')
            
            #get the information stored about the item
            item_total = pricing.send(inst_var).get_item_count
            item_price = pricing.send(inst_var).get_price
            item_bogof = pricing.send(inst_var).get_bogof
            
            #work out the "relative" numbers of items given a bogof setting
            if item_bogof == 1
                item_total = (item_total.to_f/2).ceil
            end
            
            @total_price+=item_total*item_price
        end
        
        return @total_price
    end
    
end