require "spec_helper"

describe PlayersController do

  before(:each) do
    @campaign = FactoryGirl.create(:campaign)
    Campaign.stub(:find).with(@campaign.id.to_s).and_return @campaign
  end
  
  describe "GET #index" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :index, :campaign_id => @campaign.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the index template" do
      get :index, :campaign_id => @campaign.id
      expect(response).to render_template("index")
    end

    it "loads all of the campaigns into @campaigns" do
      @players = [FactoryGirl.create(:player)]
      @campaign.stub(:players).and_return @players
      get :index, :campaign_id => @campaign.id

      expect(assigns(:players)).to match_array(@players)
    end

  end

  describe "GET #new" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :new, :campaign_id => @campaign.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the new template" do
      get :new, :campaign_id => @campaign.id
      expect(response).to render_template("new")
    end

    it "assigns a new player object" do
      @player = Player.new(:campaign_id => @campaign.id)
      @campaign.stub_chain(:players,:new).and_return @player
      get :new, :campaign_id => @campaign.id

      expect(assigns(:player)).to eq(@player)
    end

  end

  describe "GET #create" do

    before(:each) do
      @player = Player.new
      @data_block = DataBlock.new
      @campaign.stub_chain(:players,:new).and_return @player
      @player.stub(:build_data_block).and_return @data_block
    end
    
    context "error while creating" do
      
      it "renders the new template" do
        @player.stub(:save).and_return false
        get :create, :campaign_id => @campaign.id
        expect(response).to render_template("new")
      end

    end

    context "sucessful create" do
      
      it "renders the index template" do
        @player.stub(:save).and_return true
        @data_block.stub(:save).and_return true
        get :create, :campaign_id => @campaign.id
        response.should redirect_to(campaign_players_path(@campaign))
      end

    end

  end

  describe "GET #show" do

    before(:each) do
      @player = FactoryGirl.create(:player)
      @data_block = FactoryGirl.create(:data_block, :shareable => @player)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => @player.id, :campaign_id => @campaign.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the show template" do
      get :show, :id => @player.id, :campaign_id => @campaign.id
      expect(response).to render_template("show")
    end

    it "finds the campaign's player" do
      get :show, :id => @player.id, :campaign_id => @campaign.id
      expect(assigns(:player)).to eq(@player)
    end

    it "finds the campaign's player's data block" do
      get :show, :id => @player.id, :campaign_id => @campaign.id
      expect(assigns(:data_block)).to eq(@data_block)
    end

  end

end