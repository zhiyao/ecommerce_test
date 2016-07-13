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

FactoryGirl.define do
  factory :sub_categories_product do
    sub_category
    product
  end
end
