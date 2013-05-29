FactoryGirl.define do
  factory :user do
    name "Random Name"
    sequence :email do |n|
      "user#{n}@gmail.com"
    end
  end
end
