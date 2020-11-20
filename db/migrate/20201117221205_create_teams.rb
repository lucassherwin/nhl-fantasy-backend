class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :userID
      t.string :name
      t.integer :userID
    end
  end
end
