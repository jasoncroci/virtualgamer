class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.text :notes
      t.integer :encounter_id
      t.timestamps
    end
  end
end
