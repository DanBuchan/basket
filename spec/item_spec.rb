require './spec_helper'

describe Item do

    before :each do
        @item = Item.new(4.50,0,2,4.00)
        @string = "HI THERE"
    end
    
    it "can be instantiated" do
        @item.should be_an_instance_of(Item)
    end
    
    it "can get price" do
        @item.get_price.should eql 4.50
    end
    it "can get discounted price" do
        @item.increment_item_count()
        @item.increment_item_count()
        @item.get_price.should eql 4.00
    end
    it "can set price" do
        @item.set_price(12.00)
        @item.price.should eql 12.00
    end
    it "does not allow invalid price values" do
        @item.set_price(@string)
        @item.price.should eql 4.50
    end
    
    it "can get bogof" do
        @item.get_bogof.should eql 0
    end
    it "can set bogof" do
        @item.set_bogof(1)
        @item.bogof.should eql 1
    end
    it "does not allow out of range bogof values" do
        @item.set_bogof(12)
        @item.bogof.should eql 0
    end
    it "does not allow invalid bogof values" do
        @item.set_bogof(@string)
        @item.bogof.should eql 0
    end

    
    it "can get multiplier" do
       @item.get_multiplier.should eql 2 
    end
    it "can set multiplier" do
        @item.set_multiplier(12)
        @item.multiplier.should eql 12
    end
    it "does not allow invalid price values" do
        @item.set_multiplier(@string)
        @item.multiplier.should eql 2
    end
    
    it "can get discount price" do
        @item.get_discount.should eql 4.00
    end
    it "can set discount price" do
        @item.set_discount(3.00)
        @item.discount_price.should eql 3.00
    end
    it "does not allow invalid bogof values" do
        @item.set_discount(@string)
        @item.discount_price.should eql 4.00
    end
    
    
    it "can get item_count" do
        @item.get_item_count.should eql 0
    end
    it "can increment item count" do
        @item.increment_item_count()
        @item.get_item_count.should eql 1
    end
    it "can decrement item count" do
        @item.decrement_item_count()
        @item.get_item_count.should eql -1
    end
    
end