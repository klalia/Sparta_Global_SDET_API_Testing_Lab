require 'httparty'
require 'json'

class Generator
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode
    JSON.parse(self.class.get("/random/postcodes").body)
  end

  def get_multiple_postcodes
    JSON.parse(self.class.post('/postcodes', body: { "postcodes":['SL09DH', 'UB12PD']}).body)
  end

end

p = Generator.new
p p.get_single_postcode
