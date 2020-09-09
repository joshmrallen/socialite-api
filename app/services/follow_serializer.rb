# class FollowSerializer

#     def initialize(follow_object)
#         @follow = follow_object
#     end

#     def to_serialized_json
#         options = {
#             include: {
#                 follower,
#                 followee
#             }
#         }
#         @follow.to_json(options)
#     end
# end