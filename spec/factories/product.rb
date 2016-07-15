image_fixture = Rack::Test::UploadedFile.new(
                File.join(Rails.root, 'spec', 'fixtures', 'files', 'product.jpg'))
FactoryGirl.define do
  factory :product do
    name { FFaker::Name.name }
    description { FFaker::Lorem.word }
    price 5.0
    sub_categories { [FactoryGirl.create(:sub_category)] }
    image { image_fixture }
  end
end
