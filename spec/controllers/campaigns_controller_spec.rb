require "spec_helper"

describe CampaignsController do
  
  describe "GET #index" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the campaigns into @campaigns" do
      @campaigns = [FactoryGirl.create(:campaign)]
      Campaign.stub(:all).and_return(@campaigns)
      get :index

      expect(assigns(:campaigns)).to match_array(@campaigns)
    end

  end

  describe "GET #new" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "loads all of the campaigns into @campaigns" do
      @campaign = FactoryGirl.build(:campaign)
      Campaign.stub(:new).and_return(@campaign)
      get :new

      expect(assigns(:campaign)).to eq(@campaign)
    end

  end

  describe "GET #create" do
    
    before(:each) do
      @campaign = Campaign.new
      Campaign.stub(:new).and_return @campaign
    end
    
    context "error while creating" do
      
      it "renders the new template" do
        get :create
        expect(response).to render_template("new")
      end

    end

    context "sucessful create" do
      
      it "renders the index template" do
        @campaign.stub(:save).and_return true
        get :create
        response.should redirect_to(campaigns_path)
      end

    end

  end

  describe "GET #show" do

    before(:each) do
      @campaign = FactoryGirl.create(:campaign)
      Campaign.stub(:find).with(@campaign.id.to_s).and_return @campaign
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => @campaign.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the show template" do
      get :show, :id => @campaign.id
      expect(response).to render_template("show")
    end

    it "finds the campaign" do
      get :show, :id => @campaign.id
      expect(assigns(:campaign)).to eq(@campaign)
    end

  end

end