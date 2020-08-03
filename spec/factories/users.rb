FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "User name #{n}"}
    sequence(:email) { |n| "alf-#{n}@gmail.com" }
    rol {1}
    password { "testing123" }
  end
end
