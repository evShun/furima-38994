FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              { '1a' +Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'草'}
    first_name            {'生'}
    family_name_kana      {'クサ'}
    first_name_kana       {'ハエル'}
    birthday              {Faker::Date.birthday}
  end
end