class PlayerTeamsController < ApplicationController
    # GET /player_teams
    def index
        @player_teams = Team.all

        render json: @teams
    end

    # GET /player_team/1
    def show
        render json: @player_team
    end

    # POST /player_team
    def create
        player_team = Player_team.create!(player_team_params)
        player_team.save
        render json: player_team
    end

    def update
        player_team = Player_team.find(params[:id])
        player_team.update(player_team_params)
        render json: player_team
    end

    def destroy
        @player_team.destroy
    end

    private
    
    def player_team_params
        params.require(:team).permit(:user_id, :team_id)
    end
end