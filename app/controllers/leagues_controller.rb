class LeaguesController < ApplicationController
  def index
    leagues = League.all
    render json: leagues
end

def show
    league = League.find_by(id: params[:id])
    render json: league
end

def create
    league = League.new(league_params)
    # league.save
    if @league.save
        render json: @league #, status: :created, location: @league
    else
        render json: @league.errors, status: :unprocessable_entity
    end
    
    render json: league
end

def update 
    league = League.find(params[:id])
    league.update(league_params)
    render json: league
end

def delete 
    league = League.find(params[:id])
    league.delete
end

private

def league_params 
    params.require(:user).permit(:userID, :name)
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  # before_action :set_league, only: [:show, :update, :destroy]

  # # GET /leagues
  # def index
  #   @leagues = League.all

  #   render json: @leagues
  # end

  # # def new
  # #   @league = League.new
  # #   @league.save
  # # end

  # # GET /leagues/1
  # def show
  #   render json: @league
  # end

  # # POST /leagues
  # def create
  #   @league = League.new(league_params)
  #   @league.save
  #   # if @league.save
  #   #   render json: @league, status: :created, location: @league
  #   # else
  #   #   render json: @league.errors, status: :unprocessable_entity
  #   # end
  # end

  # # PATCH/PUT /leagues/1
  # def update
  #   if @league.update(league_params)
  #     render json: @league
  #   else
  #     render json: @league.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /leagues/1
  # def destroy
  #   @league.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_league
  #     @league = League.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  #   def league_params
  #     params.require(:league).permit(:userID, :name)
  #   end
end
