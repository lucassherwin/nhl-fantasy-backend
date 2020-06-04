class AddUserToLeaguesController < ApplicationController
  before_action :set_add_user_to_league, only: [:show, :update, :destroy]

  # GET /add_user_to_leagues
  def index
    @add_user_to_leagues = AddUserToLeague.all

    render json: @add_user_to_leagues
  end

  # GET /add_user_to_leagues/1
  def show
    render json: @add_user_to_league
  end

  # POST /add_user_to_leagues
  def create
    @add_user_to_league = AddUserToLeague.new(add_user_to_league_params)

    if @add_user_to_league.save
      render json: @add_user_to_league, status: :created, location: @add_user_to_league
    else
      render json: @add_user_to_league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /add_user_to_leagues/1
  def update
    if @add_user_to_league.update(add_user_to_league_params)
      render json: @add_user_to_league
    else
      render json: @add_user_to_league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /add_user_to_leagues/1
  def destroy
    @add_user_to_league.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_user_to_league
      @add_user_to_league = AddUserToLeague.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def add_user_to_league_params
      params.require(:add_user_to_league).permit(:userID, :leagueID)
    end
end
