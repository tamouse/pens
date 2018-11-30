require 'rails_helper'

RSpec.describe Address, type: :model do

  it "correctly displays a full address" do
    a = Address.create(
      label: "test",
      address_1: "123 Main",
      locality: "St. Paul",
      region_code: "MN",
      country_code: "US",
      postal_code: "55112"
    )
    expect(a.to_s).to eq("123 Main, St. Paul, Minnesota, United States of America, 55112")
  end

end
