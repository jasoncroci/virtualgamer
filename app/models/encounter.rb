class Encounter < ActiveRecord::Base
  attr_accessible :name, :description, :campaign_id
  has_one :map
  
  validates :name, :description, :presence => true
end
