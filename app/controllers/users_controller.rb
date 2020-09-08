class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        object = user.json_object
        render json: object
    end

    def followers
        followers = User.find(params[:id]).followed_by
        render json: followers
    end

    def followees
        followees = User.find(params[:id]).following #"friend's list"
        render json: followees
    end

    def update
        user = User.find(params[:id])
        # take in button dataset.username for person to follow
        # call user.follow to associate that username with our user's followees
    end

    private
        def user_params
            params.require(:user).permit(:username, :first_name, :last_name)
        end

end
