#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banner     :string

FactoryGirl.define do
  factory :category do
    name { FFaker::Name.name }
    banner { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'banner.jpg')) }
  end
end
