class CreatePlayerTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :player_teams do |t|
      t.integer :teamID
      t.integer :playerID
    end
  end
end
