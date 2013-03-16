require "spec_helper"

describe DataBlock do
	
	before(:each) do
	  @data_block = FactoryGirl.build(:data_block)
	end

	context "validations" do

    describe "presence of" do

  		it "should require name" do
  		  @data_block.name = nil
  		  expect(@data_block.valid?).to be_false
  		end

      it "should require size" do
        @data_block.size = nil
        expect(@data_block.valid?).to be_false
      end

      it "should require level" do
        @data_block.level = nil
        expect(@data_block.valid?).to be_false
      end

      it "should require speed" do
        @data_block.speed = nil
        expect(@data_block.valid?).to be_false
      end

      it "should require hit points" do
        @data_block.hit_points = nil
        expect(@data_block.valid?).to be_false
      end

      it "should require armor class" do
        @data_block.armor_class = nil
        expect(@data_block.valid?).to be_false
      end

    end

	end

end

