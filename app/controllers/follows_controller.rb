class FollowsController < ApplicationController
    def create
        follow = Follow.create(follow_params)
        render json: follow
    end

    private
    def follow_params
        params.require(:follow).permit(:follower_id, :followee_id)
    end
end