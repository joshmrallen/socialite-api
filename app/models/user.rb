require 'byebug'

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


    #### DO AFTER MESSAGE AND FOLLOW FEATURES ARE COMPLETE ###
    # https://developer.twitter.com/en/docs/tutorials/explore-a-users-tweets

    # def self.twitter_call
    #     client = Twitter::REST::Client.new do |config|
    #         config.consumer_key        = ENV['client_id']
    #         config.consumer_secret     = ENV['client_secret']
    #         # config.access_token        = ENV['bearer_token']
    #         # config.access_token_secret = "YOUR_ACCESS_SECRET"
    #     end
    # end


    # def twitter_page(username)
        
    # end

    def follow(username)
        user = User.find_by(username: username)
        Follow.create(follower_id: self.id, followee_id: user.id)
    end

    def following
        self.followee_follows.map{|follow| User.find(follow.followee_id)}
    end

    def followed_by
        self.follower_follows.map{|follow| User.find(follow.follower_id)}
    end


end
