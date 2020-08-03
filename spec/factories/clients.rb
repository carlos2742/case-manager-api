FactoryBot.define do
  factory :client do
    sequence(:email) { |n| "client-#{n}@gmail.com" }
    sequence(:first_name) {|n| "Client first name #{n}"}
    sequence(:last_name) {|n| "Client last name #{n}"}
    birthday {'1979-10-20'}
    address {'23 y M'}
    sequence(:phone_number){"5#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"}
    sequence(:ssn){"5#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"}
    sequence(:arn){"5#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"}
    sequence(:emergency_contact) {"5#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}#{rand(9)}"}
  end


end
