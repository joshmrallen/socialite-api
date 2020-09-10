require 'byebug'

User.delete_all
Follow.delete_all
Message.delete_all


User.create(username: 'irosen419', first_name: 'Ian', last_name: 'Rosen')
User.create(username: 'jennyoo', first_name: 'Jennifer', last_name: 'Yoo')
User.create(username: 'redazures', first_name: 'James', last_name: 'Wu')
User.create(username: 'joshmrallen', first_name: 'Josh', last_name: 'Allen')
User.create(username: 'stevend', first_name: 'Steven', last_name: 'Doran')
User.create(username: 'alex', first_name: 'Alexander', last_name: "Schelchere")
User.create(username: 'Vincent-Mac', first_name: 'Vincent', last_name: "Yang")
User.create(username: 'Jules', first_name: 'Julia', last_name: "Zhou")
User.create(username: 'kevkevxd', first_name: 'Kevin', last_name: "Xie")
User.create(username: 'victor_s', first_name: 'Victor', last_name: "Scholz")
User.create(username: 'mimiOJsNumba1Fan', first_name: 'Mimi', last_name: "Ojserkis")
User.create(username: 'cody.NYC', first_name: 'Cody', last_name: "Castro")
User.create(username: 'Mr.Peters', first_name: 'Matt', last_name: "Peters")
User.create(username: 'woink', first_name: 'Ward', last_name: "Price")
User.create(username: 'dbenson1017', first_name: 'Devin', last_name: "Benson")
User.create(username: 'brianwlego', first_name: 'Brian', last_name: "Lego")
User.create(username: 'amit', first_name: 'Amit', last_name: "Deshpande")
User.create(username: 'jzTimm', first_name: 'Jzavier', last_name: "Timm")
User.create(username: 'davidkirsch', first_name: 'David', last_name: "Kirsch")
User.create(username: 'vlad', first_name: 'Vlad', last_name: "Napuri")
User.create(username: 'karan', first_name: 'Karan', last_name: "Chauhan")




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