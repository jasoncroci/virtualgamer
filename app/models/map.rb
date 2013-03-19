class Map < ActiveRecord::Base
  attr_accessible :notes, :encounter_id
  belongs_to :encounter

  validates :encounter_id, :presence => true
end
