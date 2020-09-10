class MessagesController < ApplicationController

    def create
        message = Message.create(message_params)
        render json: message
    end

    private

    def message_params
        params.require(:message).permit(:sender_id, :receiver_id, :content)
    end

end