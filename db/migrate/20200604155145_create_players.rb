class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :teamID
      t.integer :playerID
      t.integer :goals
      t.integer :assists
      t.integer :ppg
      t.integer :toi
      t.integer :gwg
      t.string :pm

      t.timestamps
    end
  end
end
