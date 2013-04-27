class PricingRules
    #This class reprsents the full list of items that could be added to a bill
    #This implementation is somewhat fragile and not especially useful for any future changes
    #a production implementation of this would do better to be able to get the pricing details
    #from a database and be able to save changes and in that way act as a ORM layer. It could them
    #spawn new item instance variables based on any number of entries in the underlying db
    require_relative './item'
    attr_accessor :fr1, :sr1, :cf1
    
    def initialize()
        #set the prices and of our 3 line items
        @fr1 = Item.new(3.11,1,0,0)
        @sr1 = Item.new(5.00,0,3,4.50)
        @cf1 = Item.new(11.23,0,0,0)
    end

end