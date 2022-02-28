FactoryBot.define do
  factory :transphoto do
    title {Faker::Lorem.sentence}
    from_to {Faker::Lorem.sentence}
    message {Faker::Lorem.sentence}
    association :user

    after(:build) do |transphoto|
      transphoto.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end