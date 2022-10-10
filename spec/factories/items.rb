FactoryBot.define do
  factory :item do
    product_name { 'test' }
    content { 'testの内容' }
    category_id { 2 }
    condition_id { 2 }
    postage_type_id { 2 }
    prefecture_id { 2 }
    preparation_day_id { 2 }
    price { 3000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/510534.jpeg'), filename: '510534.jpeg')
    end

    association :user
  end
end
