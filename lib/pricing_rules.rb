class PricingRules
    #This class reprsents the full list of items that could be added to a bill
    #This implementation is somewhat fragile and not especially useful for any future changes
    #a production implementation of this would do better to be able to get the pricing details
    #from a database and be able to save changes and in that way act as a ORM layer. It could them
    #spawn new item instance variables based on any number of entries in the underlying db
    require_relative './item'
	require 'pp'
    
	#going to initialize this with a file path, in a production/scalable system
	#we's pass in a db handle or such like
    def initialize(file)
        #we create a dynamically "growable" hash of the input data
	@file = file
	@item_data = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
	_read_data(file)
	_populate_items()
        clear_item_counts()
    end
    
	def _read_data(file)
	#so in a production or scalable system we'd grab our data from a db
	#so maybe just set a handle to a query so we could lazy load the data as
	#needed. Also we wouldn't hard code the names of the fields, we'd use the names of the 
	#table columns.
	file = File.new(@file, "r")
	while (line = file.gets)
		line.to_s.chomp!
		entries = line.split(",")
		key = entries[0].to_s
		key.downcase!
		@item_data[key]["PRICE"] = entries[1]
		@item_data[key]["BOGOF"] = entries[2]
		@item_data[key]["MULTIPLIER"] = entries[3]
		@item_data[key]["DISCOUNT"] = entries[4]	
	end
    end
	
    def _populate_items
        #Now we loop through our hash of data dynamically creating instance
		#variables named for our products and adding an accessor
	@item_data.keys.each do |key| 
            item = Item.new(@item_data[key]["PRICE"].to_f,@item_data[key]["BOGOF"].to_i,
			@item_data[key]["MULTIPLIER"].to_i,@item_data[key]["DISCOUNT"].to_f)
	    self.instance_variable_set("@"+key, item)
	    singleton_class.class_eval do; attr_accessor key; end
	end	
    end
    
    #loop through the items and initialise the item totals, note that this
    #queries itself so if we really were dynamically creating our items
    #based on db contents we wouldn't have to change this routine
    def clear_item_counts
        items = self.instance_variables;
        items.each do |it|
	    if it =~ /file|item_data/
		next
	    end
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
