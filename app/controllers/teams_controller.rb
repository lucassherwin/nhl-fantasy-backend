class TeamsController < ApplicationController
  # GET /teams
  def index
    # gets all the teams
    @teams = Team.all
    # array to save teams with players
    teams_arr = []
    # loop over every team
    @teams.each do |team|
      # array to store players
      players = []
      # get each player associated with that team
      team.players.each do |player|
        # add save them in the players array
        players << player
      end
      # push the obj with the team and players into the teams array
      teams_arr << {team: team, players: players}
    end
    render json: teams_arr
  end

  # GET /teams/1
  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  # POST /teams
  def create
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
