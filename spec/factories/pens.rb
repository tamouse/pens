FactoryBot.define do
  factory :pen do
    active { false }
    name { "MyString" }
    description { "MyText" }
    manufacturer { nil }
    model { "MyString" }
    color { "MyString" }
    nib_size { "MyString" }
    nib_width { "MyString" }
    purchase_date { "2018-11-30" }
    vendor { nil }
    edc { false }
  end
end
