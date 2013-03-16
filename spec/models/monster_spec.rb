require "spec_helper"

describe Monster do
	
	before(:each) do
	  @monster = FactoryGirl.build(:monster)
	end

	context "validations" do

    describe "presence of" do

  		it "should require name" do
  		  @monster.display_name = nil
  		  expect(@monster.valid?).to be_false
  		end

      it "should require type" do
        @monster.type = nil
        expect(@monster.valid?).to be_false
      end

      it "should require experience_points" do
        @monster.experience_points = nil
        expect(@monster.valid?).to be_false
      end

    end

	end

end

