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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
