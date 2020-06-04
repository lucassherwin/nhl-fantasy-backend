class CreateAddUserToLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :add_user_to_leagues do |t|
      t.integer :userID
      t.integer :leagueID

      t.timestamps
    end
  end
end
