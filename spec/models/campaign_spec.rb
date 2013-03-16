require "spec_helper"

describe Campaign do
	
	before(:each) do
	  @campaign = FactoryGirl.build(:campaign)
	end

	context "validations" do

    describe "presence of" do

  		it "should require name" do
  		  @campaign.name = nil
  		  expect(@campaign.valid?).to be_false
  		end

    end

	end

end

