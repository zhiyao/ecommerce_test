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

  def node_and_descendants_ids
    array = self.descendants.pluck(:id)
    array.push(self.id)
    array.push(-1)
  end

end
