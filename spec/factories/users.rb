FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    introduction { Faker::Lorem.sentence }
    language { Faker::Lorem.sentence }
    hobby { Faker::Lorem.sentence }
  end
end