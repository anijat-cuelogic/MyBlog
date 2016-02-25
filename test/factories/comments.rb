FactoryGirl.define do
  factory :comment do
    description "My Comment"
    association :post, factory: :post
    association :user, factory: :user, name: 'John Paul'
  end

end
