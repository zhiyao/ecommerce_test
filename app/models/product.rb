# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class UniqueCategoryValidator < ActiveModel::Validator
  def validate(record)
    category_ids = record.sub_categories.map(&:category_id)
    if category_ids.uniq.length != category_ids.length
      record.errors[:category] << 'Can only belong to only one category'
    end
  end
end

class Product < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with UniqueCategoryValidator
  validates :name, :price, :description, presence: true

  has_many :sub_categories_products, dependent: :destroy
  has_many :sub_categories, through: :sub_categories_products
  delegate :name, to: :sub_category, prefix: true, nil: true

  mount_uploader :image, ImageUploader

end
