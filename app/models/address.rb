class Address < ApplicationRecord

  belongs_to :addressable, polymorphic: true, optional: true

  def full_address
    [address_1, address_2, address_3, address_4, locality, region_from(region_code, country_code), country_from(country_code), postal_code].compact.join(", ")
  end
  alias  :to_s :full_address

  def region_from(region_code, country_code)
    ISO3166::Country.new(country_code)
      .subdivisions[region_code]
      .name
  rescue
    region_code
  end

  def country_from(country_code)
    ISO3166::Country.new(country_code).name
  rescue
    country_code
  end
end
