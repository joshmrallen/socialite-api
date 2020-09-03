class User < ApplicationRecord
    # Follow Associations:
    # source: :follower matches with the belong_to :follower identification in the Follow model
    has_many :followers, through: :follower_follows, source: :follower
    # follower_follows "names" the Follow join table for accessing through the follower association
    # who follows the user; to see all a user's follows: simply use 'user.follower_follows' this is the same as a twitter user's followers number on their profile
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

    # source: :followee matches with the belong_to :followee identification in the Follow model
    has_many :followees, through: :followee_follows, source: :followee
    # followee_follows "names" the Follow join table for accessing through the followee association
    # who the user follows; user.followee_follows shows all the users who follow this particular user
    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"



    
    # Message Associations:
    # the user receives messages from senders; to see inbox messages: call user.sender_messages
    has_many :senders, through: :sender_messages, source: :sender
    has_many :sender_messages, foreign_key: :receiver_id, class_name: "Message"

    # the user sends to many receivers; to see sent mail, call user.receiver_messages
    has_many :receivers, through: :receiver_messages, source: :receiver
    has_many :receiver_messages, foreign_key: :sender_id, class_name: "Message"



end
