# generate product records how many records? 100 
# # Use faker gem 

# # generated input file 
# product_name,price,quantity,discount 
# iphone,50000,100,15 
# laptop,100000,2,20 
# tablet,30000,10,10 

# #process file 
# product_name,price,quantity,discount,final_price,inventory_price 
# iphone,50000,100,15,42500,4250000 
#laptop,100000,2,20,80000,160000 
# tablet,30000,10,10,27000,270000
require 'faker'

class ProductGenerator
	attr_reader :n, :filename

	def initialize(opts)
		@filename = opts[:filename]
		@n         = opts[:n]
	end

	def generate!
		open(filename, "w") do |f|
			n.times do 
				f.puts [Faker::Commerce.product_name, Faker::Commerce.price, rand(100), rand(20)].join(",")
			end
		end
	end
end