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
#

class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true

  belongs_to :sub_category, inverse_of: :products
end
