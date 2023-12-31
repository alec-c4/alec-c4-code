FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { SecureRandom.hex }

    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
