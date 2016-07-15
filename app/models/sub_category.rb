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

class SubCategory < ActiveRecord::Base
  acts_as_nested_set dependent: :destroy

  validates :name, presence: true

  belongs_to :category, inverse_of: :sub_categories
  has_many :sub_categories_products, dependent: :destroy
  has_many :products, through: :sub_categories_products

  after_create :set_category

  def set_category
    if self.category.nil? and !self.parent.nil?
      self.category_id = self.parent.category_id
      self.save!
    end
  end

  def nested_names
    self_and_ancestors.pluck(:name).join('>')
  end

  def products?
    total_product_count = self.self_and_descendants.inject(0) {|sum, n| sum + n.products.size}
    total_product_count > 0
  end

  def self.find_node_and_descendants_ids(sub_category_ids)
    set = Set.new
    sub_categories = SubCategory.find(sub_category_ids)
    sub_categories.each do |sub_category|
      set += sub_category.node_and_descendants_ids
    end
    set.to_a
  end

  def node_and_descendants_ids
    array = self.self_and_descendants.pluck(:id)
  end
end
