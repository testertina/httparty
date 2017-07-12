require 'httparty'
require 'json'

class Postcodeio 
	attr_accessor :single_postcode_result

	include HTTParty
	
	# Looks for uri to act as a base: method from HTTParty
	base_uri 'https://api.postcodes.io'

	# Define a method to request /postcodes/#{postcode} url
	# self.class makes it not a class method but an object method, if self.def then it is a class method.
	def single_postcode_search(postcode)
		# stating class allows you to include that module library(HTTParty) and inherit it's methods.
		x = self.class.get("/postcodes/#{postcode}") # Returns a JSON response of headers and body x is a locable variable here.
		@single_postcode_result = JSON.parse(x.body) # pass a JSON key value pair (body), and returns a hash in ruby
	end


end

# a = Postcodeio.new # Different x
# a.single_postcode_search('NW32EG')
# puts a.single_postcode_result