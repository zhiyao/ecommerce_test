FactoryGirl.define do
  factory :sub_category do
    name { FFaker::Name.name }
    position 1
  end
end
