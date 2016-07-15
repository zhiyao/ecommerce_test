# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  it "should have a valid factory" do
    expect(build(:product)).to be_valid
  end

  it "should has many sub categories" do
    category_1 = create(:category)
    root_category = category_1.root
    child_category = create(:sub_category, parent: root_category)
    grandchild_category = create(:sub_category, parent: child_category)
    category_2 = create(:category)
    product = build(:product, sub_categories: [category_2.root, grandchild_category])

    expect(product.sub_categories).to include(category_2.root)
    expect(product.sub_categories).to include(grandchild_category)
  end

  it "should not belong to the same category twice" do
    category_1 = create(:category)
    root_category = category_1.root
    child_category = create(:sub_category, parent: root_category)
    grandchild_category = create(:sub_category, parent: child_category)
    product = build(:product, sub_categories: [child_category, grandchild_category])

    expect(product.valid?).to be_falsy
    expect(product.errors[:category].size).to eq(1)
  end

  it "should validate it has product name, description and price" do
    product = build(:product, name: '', description: '', price: nil)
    expect(product.valid?).to be_falsy

    expect(product.errors[:name].size).to eq(1)
    expect(product.errors[:description].size).to eq(1)
    expect(product.errors[:price].size).to eq(1)
  end


end
