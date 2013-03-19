require "spec_helper"

describe MapsController do

  before(:each) do
    @encounter = FactoryGirl.create(:encounter)
    Encounter.stub(:find).with(@encounter.id.to_s).and_return @encounter
  end
  
  describe "GET #new" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :new, :encounter_id => @encounter.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "renders the new template" do
      get :new, :encounter_id => @encounter.id
      expect(response).to render_template("new")
    end

    it "assigns a new player object" do
      @map = Map.new(:encounter_id => @encounter.id)
      @encounter.stub(:build_map).and_return @map
      get :new, :encounter_id => @encounter.id

      expect(assigns(:map)).to eq(@map)
    end

  end

end