class TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
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
