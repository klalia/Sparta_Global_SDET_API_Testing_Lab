require 'httparty'
require 'json'

class Generator
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode
    JSON.parse(self.class.get("/random/postcodes").body)
  end

  def get_multiple_postcodes
    postcodes_array = ["SL09DH", "UB12PD", "G21BP", "OX495NU", "M320JG", "NE301DP"]
    JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array.sample(3)}).body)
  end

end
