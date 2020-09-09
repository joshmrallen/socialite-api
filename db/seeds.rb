require 'byebug'

User.delete_all
Follow.delete_all
Message.delete_all


User.create(username: 'irosen419', first_name: 'Ian', last_name: 'Rosen')
User.create(username: 'jennyoo', first_name: 'Jennifer', last_name: 'Yoo')
User.create(username: 'redazures', first_name: 'James', last_name: 'Wu')
User.create(username: 'joshmrallen', first_name: 'Josh', last_name: 'Allen')
User.create(username: 'stevend', first_name: 'Steven', last_name: 'Doran')

josh = User.find_by(first_name: 'Josh')
ian = User.find_by(first_name: 'Ian')
jenn = User.find_by(first_name: 'Jennifer')
james = User.find_by(first_name: 'James')
steven = User.find_by(first_name: 'Steven')

josh.follow(ian.username)
josh.follow(jenn.username)
josh.follow(james.username)

# ian.follow(james.username)
# ian.follow(jenn.username)
# ian.follow(josh.username)

jenn.follow(ian.username)
jenn.follow(james.username)
jenn.follow(josh.username)

james.follow(ian.username)
james.follow(jenn.username)
james.follow(josh.username)

steven.follow(ian.username)


Message.create(sender_id: ian.id, receiver_id: jenn.id, content: "Hello World")
Message.create(sender_id: ian.id, receiver_id: josh.id, content: "Coding is kewl")
Message.create(sender_id: james.id, receiver_id: ian.id, content: "Hi Ian")
Message.create(sender_id: josh.id, receiver_id: ian.id, content: "What's up Ian?")



puts "#{User.all.count}"