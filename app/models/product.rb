# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string
#  sub_category_id :integer
#  description     :text
#  price           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image           :string
#

class Product < ActiveRecord::Base
  validates :name, :price, presence: true

  has_many :sub_categories_products, dependent: :destroy
  has_many :sub_categories, through: :sub_categories_products
  delegate :name, to: :sub_category, prefix: true, nil: true

  mount_uploader :image, ImageUploader
end
