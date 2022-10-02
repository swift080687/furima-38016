FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'email1111' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太' }
    last_kana             { 'ヤマダ' }
    first_kana            { 'リクタ' }
    birthday              { '2022/1/1' }
  end
end
