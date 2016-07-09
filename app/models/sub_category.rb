# == Schema Information
#
# Table name: sub_categories
#
#  id             :integer          not null, primary key
#  name           :string
#  position       :integer
#  category_id    :integer
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default("0"), not null
#  children_count :integer          default("0"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SubCategory < ActiveRecord::Base
  acts_as_nested_set dependent: :destroy,
    order_column: :position

  validates :name, presence: true

  belongs_to :category, inverse_of: :sub_categories
  has_many :products, inverse_of: :sub_category
  scope :active, -> { select('sub_category.id, count(products.id) as n_products').
                 having('n_products > 10') }

  def has_products?
    total_product_count = self.self_and_descendants.inject(0) {|sum, n| sum + n.products.size}
    total_product_count > 0
  end

  def self.set_node_and_descendants_ids(sub_category_ids)
    set = Set.new
    sub_categories = SubCategory.find(sub_category_ids)
    sub_categories.each do |sub_category|
      set += sub_category.node_and_descendants_ids
    end
    set
  end

  def node_and_descendants_ids
    array = self.self_and_descendants.pluck(:id)
    array.push(-1)
  end
end
