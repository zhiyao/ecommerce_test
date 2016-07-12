require 'spec_helper'

describe 'factories' do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe "#{factory_name} factory" do
      let(:entity) { build(factory_name) }
      it 'should be valid' do
        # Does not expect OpenStruct class to be valid
        expect(entity).to be_valid unless entity.is_a? OpenStruct
      end

      it "should not raise error when created" do
        expect { entity }.to_not raise_error
      end
    end
  end
end
