class ProductProcessor

	attr_accessor :filename

	def initialize(opts)
		@filename = opts[:filename]
	end

	def process!
		contents = read_file
		parse_contents(contents)
	end

	def read_file
		file = File.open(filename, "r")
		contents = file.read
	end

	def parse_contents(contents)
		open(filename + ".output", "a") do |f|
			contents.each_line do |line|
				product_name, price, quantity, discount = line.chomp.split(",")
				final_price = (price.to_f*(1-discount.to_f/100)).round(2)
				inventory_price = (final_price*quantity.to_i).round(2)

				f.puts [product_name, price, quantity, discount, final_price, inventory_price].join(",")
			end
		end
	end
end