FactoryGirl.define do
  factory :product do
    name { FFaker::Name.name }
    description { FFaker::Lorem.word }
    price 5.0
    sub_category
  end
end
