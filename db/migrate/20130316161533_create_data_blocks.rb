class CreateDataBlocks < ActiveRecord::Migration
  def change
    create_table :data_blocks do |t|
      t.string   :name
      t.integer  :size
      t.integer  :level
      t.integer  :speed
      t.integer  :hit_points
      t.integer  :armor_class
      t.references :shareable, :polymorphic => true
      t.timestamps
    end
  end

  def down
    drop_table :data_blocks
  end
end
