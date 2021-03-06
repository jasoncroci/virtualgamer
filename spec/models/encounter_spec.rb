require "spec_helper"

describe Encounter do
	
	before(:each) do
	  @encounter = FactoryGirl.build(:encounter)
	end

	context "validations" do

	    describe "presence of" do

	  		it "should require name" do
	  		  @encounter.name = nil
	  		  expect(@encounter.valid?).to be_false
	  		end

	  		it "should require description" do
	  		  @encounter.name = nil
	  		  expect(@encounter.valid?).to be_false
	  		end

	    end

	end

	context "associations" do

		describe "map" do

			it "should have one map" do
        @map = FactoryGirl.create(:map)
        @encounter.map = @map
        expect(@encounter.map).to eq(@map)
			end

		end

	end

end

