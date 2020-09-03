class User < ApplicationRecord
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
end
