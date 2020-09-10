class MessagesController < ApplicationController


    def index
        messages = Message.all
        render json: MessageSerializer.new(messages).to_serialized_json
    end

    # coordinate: make custom route that gets id
    # chain fetch requests
        # find user info from username input
        # fill in form
        # rest of form is for post request
    def create
        # receiver = User.find_by(username: params[:username])
        message = Message.create(message_params)
        render json: MessageSerializer.new(message).to_serialized_json
    end

    private

    def message_params
        params.require(:message).permit(:sender_id, :receiver_id, :content)
    end

end