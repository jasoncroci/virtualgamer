class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :race
      t.string  :class_name
      t.integer :alignment
      t.timestamps
    end
  end

  def down
    drop_table :players
  end
end
