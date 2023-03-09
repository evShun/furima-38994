FactoryBot.define do
  factory :item do
    title             {Faker::Lorem.characters(number: rand(1..40))}
    text              {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from: 1, to: 10)}
    status_id         {Faker::Number.between(from: 1, to: 6)}
    charge_id         {Faker::Number.between(from: 1, to: 2)}
    prefecture_id     {Faker::Number.between(from: 1, to: 47)}
    shipping_id       {Faker::Number.between(from: 1, to: 3)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
