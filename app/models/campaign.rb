class Campaign < ActiveRecord::Base
  attr_accessible :name
  has_many :players
  has_many :encounters
  
  validates :name, :presence => true
end
