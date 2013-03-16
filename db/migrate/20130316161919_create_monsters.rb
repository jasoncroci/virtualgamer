class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string  :display_name
      t.integer :type
      t.integer :experience_points
      t.timestamps
    end
  end

  def down
    drop_table :monsters
  end
end
