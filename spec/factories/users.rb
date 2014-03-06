FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "princess#{n}" }
    password '123'
  end
end