class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
  	@campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:campaign])
  	if @campaign.save
  	  redirect_to campaigns_path
  	else
  	  render :new
  	end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

end
