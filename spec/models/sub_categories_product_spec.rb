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

require 'rails_helper'

RSpec.describe SubCategoriesProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
