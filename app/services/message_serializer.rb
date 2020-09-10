class MessageSerializer
    def initialize(message_object)
        @message = message_object
    end

    def to_serialized_json
        options = {
            include: [:sender, :receiver]
        }
        @message.to_json(options)
    end
end