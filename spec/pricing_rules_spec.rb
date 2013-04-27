require './spec_helper'

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
    
    #no need for further testing here as that's all covered
    #in the item spec. Don't even need that second test there really
end