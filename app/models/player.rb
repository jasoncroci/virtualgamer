class Player < ActiveRecord::Base
  attr_accessible :race, :class_name, :alignment, :campaign_id
  has_one :data_block, :as => :shareable
  belongs_to :campaign

  validates :race, :class_name, :alignment, :campaign_id, :presence => true
end
