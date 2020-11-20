class Player_team < ApplicationRecord
    belongs_to :player
    belongs_to :team
end