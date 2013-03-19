require "spec_helper"

describe Map do
	
	before(:each) do
	  @map = FactoryGirl.build(:map)
	end

	context "validations" do

	    describe "presence of" do

	  		it "should require encounter_id" do
	  		  @map.encounter_id = nil
	  		  expect(@map.valid?).to be_false
	  		end

	    end

	end

	context "associations" do

		describe "campaign" do

			it "should belong_to an encounter" do
				@encounter = FactoryGirl.create(:encounter)
        @map.encounter = @encounter
        expect(@map.encounter).to eq(@encounter)
			end

		end

	end

end

