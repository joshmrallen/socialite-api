require 'byebug'
require 'dotenv/load'
require 'twitter'

class User < ApplicationRecord
    # Follow Associations:
    # source: :follower matches with the belong_to :follower identification in the Follow model
    # follower_follows "names" the Follow join table for accessing through the follower association
    # who follows the user; to see all a user's follows: simply use 'user.follower_follows' this is the same as a twitter user's followers number on their profile
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :follower_follows, source: :follower

    # source: :followee matches with the belong_to :followee identification in the Follow model
    # followee_follows "names" the Follow join table for accessing through the followee association
    # who the user follows; user.followee_follows shows all the users who follow this particular user
    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followees, through: :followee_follows, source: :followee

    
    # Message Associations:
    # the user receives messages from senders; to see inbox messages: call user.sender_messages
    has_many :sender_messages, foreign_key: :receiver_id, class_name: "Message"
    has_many :senders, through: :sender_messages, source: :sender
    
    # the user sends to many receivers; to see sent mail, call user.receiver_messages
    has_many :receiver_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :receivers, through: :receiver_messages, source: :receiver
    

    #### DO AFTER MESSAGE AND FOLLOW FEATURES ARE COMPLETE ###
    # https://developer.twitter.com/en/docs/tutorials/explore-a-users-tweets

    # def self.twitter_call
    #     client = Twitter::REST::Client.new do |config|
    #         config.consumer_key        = ENV['client_id']
    #         config.consumer_secret     = ENV['client_secret']
    #         config.access_token        = ENV['access_token']
    #         config.access_token_secret = ENV['access_token_secret']
    #     end
    #     client.user("jyoo91")
    # end

    # def twitter_page(username)
        
    # end

    def follow(username)
        user = User.find_by(username: username)
        Follow.create(follower_id: self.id, followee_id: user.id)
    end

    def following
        self.followee_follows.map do |follow|
            {
                follow_id: follow.id,
                user: User.find(follow.followee_id)
            } 
        end
    end

    def followed_by
        self.follower_follows.map do |follow| 
            {
                follow_id: follow.id,
                user: User.find(follow.follower_id)
            }
        end
    end

    def received_messages_array
        sent = []

        self.sender_messages.each_with_index do |message, index|
            sent[index] = {
                sender: User.find(message.sender_id),
                receiver: User.find(message.receiver_id),
                content: message.content
            } 
        end
        return sent     
    end

    def sent_messages_array
        received = []

        self.receiver_messages.each_with_index do |message, index|
            received[index] = {
                sender: User.find(message.sender_id),
                receiver: User.find(message.receiver_id),
                content: message.content
            }
        end
        return received
    end

    def json_object
        object = {
            user_info: self,
            followers: self.followed_by,
            followees: self.following,
            messages: {
                sent: self.sent_messages_array,
                received: self.received_messages_array
            }
        }
    end

end
