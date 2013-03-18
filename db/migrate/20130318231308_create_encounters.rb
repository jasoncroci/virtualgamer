class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string  :name
      t.text    :description
      t.integer :experience_points
      t.integer :campaign_id
      t.timestamps
    end
  end

  def down
  	drop_table :encounters
  end
end
