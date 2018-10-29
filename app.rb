require_relative 'product_generator'
require_relative 'product_processor'

filename = "myfile.csv"
ProductGenerator.new(filename: filename, n: 10000).generate!
ProductProcessor.new(filename: filename).process!