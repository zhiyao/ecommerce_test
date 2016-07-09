# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banner     :string
#

class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :sub_categories, inverse_of: :category
  has_one :root, -> { where parent_id: nil }, class_name: 'SubCategory', dependent: :destroy

  scope :active, -> { Category.all.select { |e| e.has_products? } }
  after_create :set_root
  after_save :set_root_sub_category_name

  mount_uploader :banner, CategoryBannerUploader

  def has_products?
    self.root.has_products?
  end

  private

  def set_root
    self.root ||= SubCategory.create!(category_id: id, name: name)
  end

  def set_root_sub_category_name
    root.update_attributes(name: name)
  end
end
