FactoryGirl.define do
  factory :post do
    title "MyString"
    description "MyText"
    association :user, factory: :user, name: 'John Doe'
  end

end
