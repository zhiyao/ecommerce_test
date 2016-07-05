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
  belongs_to :category, inverse_of: :sub_categories

  validates :name, presence: true
  has_many :products, inverse_of: :sub_category
end
