require 'httparty'
require 'json'
require_relative './lib/data.rb'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  attr_accessor :single

  def initialize
    @single_postcode = Generator.new
  end

  def get_single_postcode
    @single_postcode.get_single_postcode
  end

  def get_multiple_postcodes
    JSON.parse(self.class.post('/postcodes', body: { "postcodes":['SL09DH', 'UB12PD']}).body)
  end

  def get_status_message
    get_single_postcode["status"]
  end

  def get_postcode
    get_single_postcode["result"]["postcode"].gsub!(/\s/,'')
  end

  def get_quality_integer
    get_single_postcode["result"]["quality"]
  end

  def get_ordnance_survery_eastings
    get_single_postcode["result"]["eastings"]
  end

  def get_ordnance_survery_northings
    get_single_postcode["result"]["northings"]
  end

  def get_four_constituent_countrys
    get_single_postcode["result"]["country"]
  end

  def get_NHS_authroity
    get_single_postcode["result"]["nhs_ha"]
  end

  def get_longitude_value
    get_single_postcode["result"]["longitude"]
  end

  def get_latitude_value
    get_single_postcode["result"]["latitude"]
  end

  def get_parliamentry_constituency
    get_single_postcode["result"]["parliamentary_constituency"]
  end

  def get_european_electoral_region
    get_single_postcode["result"]["european_electoral_region"]
  end

  def get_primary_care_trust
    get_single_postcode["result"]["primary_care_trust"]
  end

  def get_region
    get_single_postcode["result"]["region"]
  end

  def get_parish
    get_single_postcode["result"]["parish"]
  end

  def get_lsoa
    get_single_postcode["result"]["lsoa"]
  end

  def get_msoa
    get_single_postcode["result"]["msoa"]
  end

  def get_admin_district
    get_single_postcode["result"]["codes"]["admin_district"]
  end

  def get_incode
    get_single_postcode["result"]["incode"]
  end

  def get_first_query
    get_multiple_postcodes["result"][0]["query"]
  end

  def get_second_query
    get_multiple_postcodes["result"][1]["query"]
  end

end
