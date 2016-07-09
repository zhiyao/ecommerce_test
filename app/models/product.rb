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
  validates :name, :description, :price, presence: true

  belongs_to :sub_category, inverse_of: :products, counter_cache: true
  delegate :name, to: :sub_category, prefix: true, nil: true

  mount_uploader :image, ImageUploader
end
