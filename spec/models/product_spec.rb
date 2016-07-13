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

require 'rails_helper'

RSpec.describe Product, type: :model do

  it "should have a valid factory" do
    expect(build(:product)).to be_valid
  end

end
