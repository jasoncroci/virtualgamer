class PlayersController < ApplicationController
  before_filter :find_campaign

  def index
    @players = @campaign.players
	end

  def new
    @player = @campaign.players.new
  end

  def create
    @player = @campaign.players.new(params[:player])
    @data_block = @player.build_data_block(params[:data_block])
    
    if @player.save && @data_block.save
      redirect_to campaign_players_path(@campaign)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
    @data_block = @player.data_block
  end

  private 

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
