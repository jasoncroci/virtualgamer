require "spec_helper"

describe Player do
	
	before(:each) do
	  @player = FactoryGirl.build(:player)
	end

	context "validations" do

    describe "presence of" do

  		it "should require race" do
  		  @player.race = nil
  		  expect(@player.valid?).to be_false
  		end

      it "should require class_name" do
        @player.class_name = nil
        expect(@player.valid?).to be_false
      end

      it "should require alignment" do
        @player.alignment = nil
        expect(@player.valid?).to be_false
      end

    end

	end

end

