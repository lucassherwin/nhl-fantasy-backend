class League < ApplicationRecord
    belongs_to :user
    has_many :teams
    has_many :add_user_to_leagues
end
