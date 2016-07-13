# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banner     :string
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  it "should have a valid factory" do
    expect(build(:category)).to be_valid
  end

  describe "#products?" do
    it "should no has products?" do
      category = create(:category)
      expect(category.products?).to be_falsy
    end

    it "should has a product" do
      category = create(:category)
      _product = create(:product, sub_categories: [category.root])
      expect(category.products?).to be_truthy
    end
  end

  describe "#root" do
    it "should has a root and category name" do
      category = create(:category)
      expect(category.root.name).to eq(category.name)
    end
  end

end
