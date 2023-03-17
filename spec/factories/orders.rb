FactoryBot.define do
  factory :order do

    postal_code        {"090-0000"}
    prefecture_id      {Faker::Number.between(from: 1, to: 47)}
    city               {"富山市"}
    number             {1234}
    building           {"建物"}
    phone_number       {"09012345678"}
    token              {Faker::Lorem.sentence}

  end
end
