class Monster < ActiveRecord::Base
  attr_accessible :display_name, :type, :experience_points
  has_one :data_block, :as => :shareable

  validates :display_name, :type, :experience_points, :presence => true
end
