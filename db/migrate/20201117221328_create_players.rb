class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :goals
      t.integer :assists
      t.integer :ppg
      t.string :toi
      t.integer :gwg
      t.integer :pim
      t.integer :points
      t.integer :hits
    end
  end
end
