class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(username: params[:username])
        if user
            render json: user
        else
            render json: {message: 'Could not find user'}
        end
    end

    def create
        user = User.new(user_params)
        user.save
        render json: user
    end

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def delete 
        user = User.find(params[:id])
        user.delete
    end

    private

    def user_params 
        params.require(:user).permit(:username, :firstName, :lastName)
    end
end
