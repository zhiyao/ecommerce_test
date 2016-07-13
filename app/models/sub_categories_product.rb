# == Schema Information
#
# Table name: sub_categories_products
#
#  id              :integer          not null, primary key
#  sub_category_id :integer
#  product_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SubCategoriesProduct < ActiveRecord::Base
  belongs_to :sub_category, counter_cache: :products_count
  belongs_to :product
end
