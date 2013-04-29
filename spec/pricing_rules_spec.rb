require 'spec_helper'

describe PricingRules do

    before :each do
        @pr = PricingRules.new()
    end
    
    it "can be instantiated" do
        @pr.should be_an_instance_of(PricingRules)
    end
    
    it "can set item price" do
        @pr.fr1.set_price(2.00)
        @pr.fr1.price.should eql 2.00
    end
    
    it "can clear the item counts " do
        @pr.fr1.increment_item_count
        @pr.sr1.increment_item_count
        @pr.cf1.increment_item_count
        @pr.clear_item_counts
        @pr.fr1.item_count.should eql 0
        @pr.sr1.item_count.should eql 0
        @pr.cf1.item_count.should eql 0
        
    end
    
    it "populates the items" do
        #somewhat dumb here as the item values are all hard populated 
        #but were there an underlying db then we'd set it up with test
        #values in the before statement at the top of these tests and
        #test for those values
        @pr.fr1.get_price.should eql 3.11
    end
    
end
