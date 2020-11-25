class RenameUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :userID, :user_id
  end
end
