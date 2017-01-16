FactoryGirl.define do
  factory :user do
    email { Faker::Internet.user_name + "@test.com" }
    password { "password" }
    password_confirmation { "password" }
    nickname { Faker::Internet.user_name }
  end
end
