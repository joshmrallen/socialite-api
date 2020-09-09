class UserSerializer

    def initialize(user_object)
        @user = user_object
    end

    def to_serialized_json
        options = {
            include: {
                follower_follows: {
                    include: [:follower]
                }, 
                followee_follows: {
                    include: [:followee]
                },
                sender_messages: {
                    include: [:sender]
                },
                receiver_messages: {
                    include: [:receiver]
                }
            }
        }
        @user.to_json(options)
    end
end