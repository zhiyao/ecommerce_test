# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  parent_id   :integer
#  name        :string
#  position    :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubCategory < ActiveRecord::Base
  acts_as_nested_set dependent: :destroy,
    order_column: :position

  validates :name, presence: true

  belongs_to :category, inverse_of: :sub_categories
  has_many :products, inverse_of: :sub_category

end
