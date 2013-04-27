#!/usr/local/bin/ruby

require_relative 'lib/item'
require_relative 'lib/pricing_rules'
require_relative 'lib/checkout'

pricing_rules = PricingRules.new()
co = Checkout.new(pricing_rules)
co.scan("fr1")
co.scan("sr1")
co.scan("fr1")
co.scan("cf1")
price = co.total
puts "1st Basket Cost: " + price.to_s

pricing_rules = PricingRules.new()
co = Checkout.new(pricing_rules)
co.scan("fr1")
co.scan("fr1")
price = co.total
puts "2nd Basket Cost: " + price.to_s

pricing_rules = PricingRules.new()
co = Checkout.new(pricing_rules)
co.scan("sr1")
co.scan("sr1")
co.scan("fr1")
co.scan("sr1")
price = co.total
puts "3rd Basket Cost: " + price.to_s




