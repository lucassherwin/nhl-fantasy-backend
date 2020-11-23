class AddLocationToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :location, :string
  end
end
