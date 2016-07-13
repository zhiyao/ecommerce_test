require 'rails_helper'

describe ApplicationHelper do
  describe 'active_link?' do
    it "return active when controller matches arguments" do
      stub_controller_name('foo')

      expect(helper.active_link?('foo')).to eq('active')
    end

    it "return nothing when controller does not matches arguments" do
      stub_controller_name('foo')

      expect(helper.active_link?('bar')).to eq(nil)
    end

    def stub_controller_name(value)
      allow(helper.controller).to receive(:controller_name).and_return(value)
    end
  end

  describe 'sub_category_tree_filter' do
    it "should return sub_category that has products and its ancestors" do
      category = create(:category)
      root_sub_category = category.root
      create(:sub_category, parent: root_sub_category)
      child = create(:sub_category, parent: root_sub_category)
      grandchild = create(:sub_category, parent: child)
      product = create(:product, sub_category: grandchild)

      expect(helper.sub_category_tree_filter(category, root_sub_category)).to match(grandchild.name)
    end
  end

  describe 'product_breadcrumbs' do
    it "should return product breadcrumbs" do
      category = create(:category)
      root_sub_category = category.root
      create(:sub_category, parent: root_sub_category)
      child = create(:sub_category, parent: root_sub_category)
      grandchild = create(:sub_category, parent: child)
      product = create(:product, sub_category: grandchild)

      expect(helper.product_breadcrumbs(grandchild)).to match(root_sub_category.name)
      expect(helper.product_breadcrumbs(grandchild)).to match(grandchild.name)
    end
  end
end
