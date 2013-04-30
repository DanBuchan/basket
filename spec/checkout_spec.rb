require 'spec_helper'
require 'pp'

describe Checkout do

    before :each do
		path = "item_data.txt"
        pricing_rules = PricingRules.new(path)
        @co = Checkout.new(pricing_rules)
    end
    
    it "can be instantiated" do
        @co.should be_an_instance_of(Checkout)
    end
    
    it "assigns pricing" do
        @co.pricing.should_not be_nil
    end
    
    it "can scan valid items" do
        @co.scan("fr1")
        @co.pricing.fr1.get_item_count.should eql 1
    end
    it "rejects invalid items" do
        @co.scan("blarg").should eql 0
    end
    
    it "can return the total" do
        @co.pricing.fr1.increment_item_count
        @co.total.should eql 3.11
    end
    it "correctly applies bogof" do
        @co.pricing.fr1.increment_item_count
        @co.pricing.fr1.increment_item_count
        @co.total.should eql 3.11
    end

    it "correctly totals first basket" do
		@co.scan("fr1")
        @co.scan("sr1")
        @co.scan("fr1")
        @co.scan("cf1")
		#@co.total.should eql 22.25
        #The text of the test is wrong as it does not take in to account
        #the bogof for fruit tea
        @co.total.should eql 19.34
    end
    
    it "correctly totals second basket" do
        @co.scan("fr1")
        @co.scan("fr1")
        @co.total.should eql 3.11
    end
    it "correctly totals third basket" do
        @co.scan("sr1")
        @co.scan("sr1")
        @co.scan("fr1")
        @co.scan("sr1")
        @co.total.should eql 16.61
    end
    
end
