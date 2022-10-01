FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'def' }
    first_name            { 'abc' }
    last_kana             { 'デフ' }
    first_kana            { 'エービーシー' }
    birthday              { '2022/1/1' }
  end
end
