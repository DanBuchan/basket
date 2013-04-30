Installing and running
======================

Unzip it yo!

Test
----
run rspec from the root dir of the project
> rspec spec/[FILE].rb

Worked example
--------------
run main.rb to see an example of using the classes which solve this problem
> ruby main.rb

Files
=====

lib/
----
Contains the 3 classes which implement the interface asked for
spec/
-----
Contains the 3 rspec test which test the assorted api functionality
main.rb
-------
A worked example of the API being used.
item_data.txt
-------------
The rules for the item pricing and their IDs. In a production system I'd rather have a database with a talble something
like:

| id | price | bogof | multiplier | discount price |

Class Notes
===========
checkout.rb
-----------
Implements the API as described in the problem. Is also completely agnostic to the number of items in the
pricing/item list. So it should handle any arbitrarily small/large list of items and their prices.
item.rb
-------
This class represents the items in the supermarket, keeping track of their prices and bogof or bulk offer status and
prices. Has a full set of setters and getters for the item data. Can be instantiated with any number of arguments 
and does some minor type checking to stop non-numberic values being passed to numberic fields. It also keeps track 
of how many of each item has been scanned bycheckout.rb. This in turn means that .get_price will return the discount
price if an item count exceeds the bulk value if set. Possibly it would be better to move keeping track of an items
scanned total where the instances of each item are created (i.e. pricing_rules).
pricing_rules.rb
----------------
This class instantiates a list of all the items and initialises their prices. For now we read the data out of a text
file but in a production system with multiple checkouts/clients and maybe multiple users making price and item 
adjustments I'd envisage the system would be underpinned by a database. This class acts as a very lite ORM layer.
Building the item list dynamically and also populating each item's data on the fly. Then we could simply add an admin 
class alongside checkout.rb which is capable of adding, deleting and updating items.
