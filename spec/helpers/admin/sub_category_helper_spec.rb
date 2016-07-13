require 'rails_helper'

describe Admin::SubCategoryHelper do
  describe "sub_category_tree" do
    it "should return sub_category children" do
      category = create(:category)
      root_sub_category = category.root
      create(:sub_category, parent: root_sub_category)
      child = create(:sub_category, parent: root_sub_category)
      grandchild = create(:sub_category, parent: child)
      create(:product, sub_categories: [grandchild])

      expect(helper.sub_category_tree(category, root_sub_category)).to match(grandchild.name)
    end
  end

  describe "breadcrumbs" do
    it "should return breadcrumbs" do
      category = create(:category)
      root_sub_category = category.root
      create(:sub_category, parent: root_sub_category)
      child = create(:sub_category, parent: root_sub_category)
      grandchild = create(:sub_category, parent: child)
      create(:product, sub_categories: [grandchild])

      expect(helper.breadcrumbs(category, grandchild)).to match(grandchild.name)
    end
  end
end
