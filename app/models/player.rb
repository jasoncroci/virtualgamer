class Player < ActiveRecord::Base
  attr_accessible :race, :class_name, :alignment
  has_one :data_block, :as => :shareable

  validates :race, :class_name, :alignment, :presence => true
end
