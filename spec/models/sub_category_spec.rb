# == Schema Information
#
# Table name: sub_categories
#
#  id             :integer          not null, primary key
#  name           :string
#  category_id    :integer
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default("0"), not null
#  children_count :integer          default("0"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  products_count :integer
#

require 'rails_helper'

RSpec.describe SubCategory, type: :model do

  it "should have a valid factory" do
    expect(build(:sub_category)).to be_valid
  end

  describe "#products?" do
    let(:sub_category) { build(:sub_category) }
    it "should show false if it has not products" do
      expect(sub_category.products?).to be_falsy
    end

    it "should be true if it has product under it" do
      create(:product, sub_categories: [sub_category])
      expect(sub_category.products?).to be_truthy
    end

    it "should be true if a child sub category has a product" do
      child_sub_category = create(:sub_category, parent: sub_category)
      create(:product, sub_categories: [child_sub_category])
      sub_category.reload
      expect(sub_category.products?).to be_truthy
    end
  end

  describe "#find_node_and_descendants_ids" do
    let(:sub_category) { build(:sub_category) }
    it "should return node ids and all its descendants id" do
      child_sub_category_1 = create(:sub_category, parent: sub_category)
      child_sub_category_2 = create(:sub_category, parent: sub_category)
      sub_category.reload
      grandchild_sub_category_1 = create(:sub_category, parent: child_sub_category_1)
      non_child_sub_category = create(:sub_category)
      array = SubCategory.find_node_and_descendants_ids([sub_category.id])
      expect(array.include?(child_sub_category_2.id)).to be_truthy
      expect(array.include?(grandchild_sub_category_1.id)).to be_truthy
      expect(array.include?(non_child_sub_category.id)).to be_falsy
    end
  end

end
