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

require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
