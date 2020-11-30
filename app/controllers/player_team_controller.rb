class TeamsController < ApplicationController
    # GET /player_teams
    def index
        @teams = Team.all

        render json: @teams
    end

    # GET /player_team/1
    def show
        render json: @team
    end

    # POST /player_team
    def create
        team = Team.create!(team_params)
        team.save
        render json: team
    end

    def update
        team = Team.find(params[:id])
        team.update(team_params)
        render json: team
    end

    def destroy
        @team.destroy
    end

    private
    def player_team_params
        params.require(:team).permit(:user_id, :team_id)
    end
end