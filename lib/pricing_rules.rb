class PricingRules
    #This class reprsents the full list of items that could be added to a bill
    #This implementation is somewhat fragile and not especially useful for any future changes
    #a production implementation of this would do better to be able to get the pricing details
    #from a database and be able to save changes and in that way act as a ORM layer. It could them
    #spawn new item instance variables based on any number of entries in the underlying db
    require_relative './item'
    attr_accessor :fr1, :sr1, :cf1
    
    def initialize()
        #here I'm just creating 3 new instances of item
        #were this a backed by a database no the fly I'd create as many objects as there were items in the db
        #@fr1 = Item.new(3.11,1,0,0)
        #@sr1 = Item.new(5.00,0,3,4.50)
        #@cf1 = Item.new(11.23,0,0,0)
        @fr1 = Item.new()
        @sr1 = Item.new()
        @cf1 = Item.new()
        _populate_items()
        clear_item_counts()
    end
    
    def _populate_items
        #this routine would query the db and get the values, for now for this toy example we'll
        #just populate the objects with the values as per the problem instructions
        @fr1.set_price(3.11)
        @fr1.set_bogof(1)
        @fr1.set_multiplier(0)
        @fr1.set_discount(0)
        
        @sr1.set_price(5.00)
        @sr1.set_bogof(0)
        @sr1.set_multiplier(3)
        @sr1.set_discount(4.50)
        
        @cf1.set_price(11.23)
        @cf1.set_bogof(0)
        @cf1.set_multiplier(0)
        @cf1.set_discount(0)
    end
    
    #loop through the items and initialise the item totals, note that this
    #queries itself so if we really were dynamically creating our items
    #based on db contents we wouldn't have to change this routine
    def clear_item_counts
        items = self.instance_variables;
        items.each do |it|
            inst_var = it.to_s
            inst_var.gsub!(/@/,'')
            self.send(inst_var).clear_item_count
        end
    end
    
    #here's 2 stubs for other db operations were this a production system, for updating item data and deleting
    #respectively
    #def update_items
    #end
    #def delete_item
    #end
    

end