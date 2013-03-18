class EncountersController < ApplicationController
  before_filter :find_campaign

  def index
    @encounters = @campaign.encounters
  end

  def new
    @encounter = @campaign.encounters.new
  end

  def create
    @encounter = @campaign.encounters.new(params[:encounter])
    if @encounter.save
      redirect_to campaign_encounters_path(@campaign)
    else
      render :new
    end
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  private 

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
