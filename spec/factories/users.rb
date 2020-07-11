FactoryBot.define do
  factory :user do
    username { "FooBar" }
    birthday { '1990-01-01' }
    sequence(:email) { |n| "foobar#{n}@example.com" }
    password { "password" }
  end
end
