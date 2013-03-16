class Campaign < ActiveRecord::Base
  attr_accessible :name
  has_many :players
  
  validates :name, :presence => true
end
