class PlayerTeamsController < ApplicationController
    # GET /player_teams
    def index
        @player_teams = Player_team.all

        render json: @player_teams
    end

    # GET /player_team/1
    def show
        render json: @player_team
    end

    # POST /player_team
    def create
        byebug
        player_team = PlayerTeam.create(player_team_params)
        player_team.save
        render json: player_team
    end

    # def update
    #     player_team = Player_team.find(params[:id])
    #     player_team.update(player_team_params)
    #     render json: player_team
    # end

    # def destroy
    #     @player_team.destroy
    # end

    private
    
    def player_team_params
        params.require(:player_team).permit(:team_id, :player_id)
    end
end