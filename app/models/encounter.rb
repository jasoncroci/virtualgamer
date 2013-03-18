class Encounter < ActiveRecord::Base
  attr_accessible :name, :description, :campaign_id

  validates :name, :description, :presence => true
end
