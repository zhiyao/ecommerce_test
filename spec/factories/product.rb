FactoryGirl.define do
  factory :product do
    name { FFaker::Name.name }
    description { FFaker::Lorem.word }
    price 5.0
    sub_categories { [FactoryGirl.create(:sub_category)] }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'product.jpg')) }
  end
end
