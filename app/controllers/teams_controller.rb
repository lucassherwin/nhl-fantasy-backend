class TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.all
    teams_arr = []
    @teams.each do |team|
      players = []
      team.players.each do |player|
        players << player
      end
      teams_arr << {team: team, players: players}
    end
    render json: teams_arr
  end

  # GET /teams/1
  def show
    # byebug
    @team = Team.find(params[:id])
    render json: @team
  end

  # gets the teams players and renders them
  # def players
  #   team = Team.find(params[:id])
  #   players = team.players
  #   render json: players
  # end

  # POST /teams
  def create
    # byebug
    team = Team.create!(team_params)
    team.save
    render json: team
  end

  # PATCH/PUT /teams/1
  def update
    team = Team.find(params[:id])
    team.update(team_params)
    render json: team
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    def team_params
      params.require(:team).permit(:user_id, :name, :location)
    end
end
