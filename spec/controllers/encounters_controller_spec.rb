require "spec_helper"

describe EncountersController do

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
      @encounters = [FactoryGirl.create(:encounter)]
      @campaign.stub(:encounters).and_return @encounters
      get :index, :campaign_id => @campaign.id

      expect(assigns(:encounters)).to match_array(@encounters)
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
      @encounter = Encounter.new(:campaign_id => @campaign.id)
      @campaign.stub_chain(:encounters,:new).and_return @encounter
      get :new, :campaign_id => @campaign.id

      expect(assigns(:encounter)).to eq(@encounter)
    end

  end

  describe "GET #create" do

    before(:each) do
      @encounter = Encounter.new
      @campaign.stub_chain(:encounters,:new).and_return @encounter
    end
    
    context "error while creating" do
      
      it "renders the new template" do
        @encounter.stub(:save).and_return false
        get :create, :campaign_id => @campaign.id
        expect(response).to render_template("new")
      end

    end

    context "sucessful create" do
      
      it "renders the index template" do
        @encounter.stub(:save).and_return true
        get :create, :campaign_id => @campaign.id
        response.should redirect_to(campaign_encounters_path(@campaign))
      end

    end

  end

  describe "GET #show" do

    before(:each) do
      @encounter = FactoryGirl.create(:encounter)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => @encounter.id, :campaign_id => @campaign.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the show template" do
      get :show, :id => @encounter.id, :campaign_id => @campaign.id
      expect(response).to render_template("show")
    end

    it "finds the campaign's player" do
      get :show, :id => @encounter.id, :campaign_id => @campaign.id
      expect(assigns(:encounter)).to eq(@encounter)
    end

  end

end