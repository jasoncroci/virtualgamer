class DataBlock < ActiveRecord::Base
  attr_accessible :name, :size, :level, :speed, :hit_points, :armor_class
  belongs_to :shareable, :polymorphic => true

  validates :name, :size, :level, :speed, :hit_points, :armor_class, :presence => true
end
