FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '横浜市' }
    address { '青山' }
    building_name { '柳ビル' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
