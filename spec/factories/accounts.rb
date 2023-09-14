FactoryBot.define do
  factory :account do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    zipcode { Faker::Address.zip_code }
    address { Faker::Address.street_address }
   

    trait :as_individual do
      date_of_birth { '24-10-1966' }
      account_role { 'individual' }
    end

    trait :blank_password do
      password { nil }
    end
  end
end
