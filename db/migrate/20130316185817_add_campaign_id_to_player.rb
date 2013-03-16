class AddCampaignIdToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :campaign_id, :integer
  end
end
