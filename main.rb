#!/usr/local/bin/ruby

require_relative 'lib/item'
require_relative 'lib/pricing_rules'
require_relative 'lib/checkout'


path = "item_data.txt"
pricing_rules = PricingRules.new(path)


pricing_rules.fr1.set_bogof(0)
#here we can make arbitrary pricing changes before we start a new
#basket
co = Checkout.new(pricing_rules)
co.scan("fr1")
co.scan("sr1")
co.scan("fr1")
co.scan("cf1")
price = co.total
puts "without fr1 bogof"
puts "1st Basket Cost: " + price.to_s

pricing_rules.fr1.set_bogof(1)
co = Checkout.new(pricing_rules)
co.scan("fr1")
co.scan("sr1")
co.scan("fr1")
co.scan("cf1")
price = co.total
puts "with fr1 bogof"
puts "1st Basket Cost: " + price.to_s+"\n\n"


#here we can make arbitrary pricing changes before we start a new
#basket
#pricing_rules.fr1.set_price(200.00)
#pricing_rules.fr1.set_bogof(0)
#These rules will carry forward to future baskets until changed

co = Checkout.new(pricing_rules)
co.scan("fr1")
co.scan("fr1")
price = co.total
puts "2nd Basket Cost: " + price.to_s

#here we can make arbitrary pricing changes before we start a new
#basket
co = Checkout.new(pricing_rules)
co.scan("sr1")
co.scan("sr1")
co.scan("fr1")
co.scan("sr1")
price = co.total
puts "3rd Basket Cost: " + price.to_s




