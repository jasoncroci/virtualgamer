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

	context "associations" do

	    it "should have many players" do
          @players = [FactoryGirl.create(:player)]
	  	  @campaign.players = @players
	  	  expect(@campaign.players).to match_array(@players)
	  	end

	  	it "should have many encounters" do
          @encounters = [FactoryGirl.create(:encounter)]
	  	  @campaign.encounters = @encounters
	  	  expect(@campaign.encounters).to match_array(@encounters)
	  	end

	end

end

