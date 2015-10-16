FactoryGirl.define do
  factory :user do
    name "a name"
    sequence(:email) {|n| "email#{n}@example.com"}
    password 'password123'
  end

end
