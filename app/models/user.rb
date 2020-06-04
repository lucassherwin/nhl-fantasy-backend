class User < ApplicationRecord
    has_many :leagues
    has_many :add_user_to_leagues
    has_many :teams
end
