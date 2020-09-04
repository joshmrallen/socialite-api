require 'dotenv-rails'
require 'twitter'
require 'byebug'

User.delete_all
Follow.delete_all


User.create(username: 'irosen419', first_name: 'Ian', last_name: 'Rosen')
User.create(username: 'jennyoo', first_name: 'Jennifer', last_name: 'Yoo')
User.create(username: 'redazures', first_name: 'James', last_name: 'Wu')
User.create(username: 'joshmrallen', first_name: 'Josh', last_name: 'Allen')

josh = User.find_by(first_name: 'Josh')
ian = User.find_by(first_name: 'Ian')
jenn = User.find_by(first_name: 'Jennifer')
james = User.find_by(first_name: 'James')

josh.follow(ian.username)
josh.follow(jenn.username)
josh.follow(james.username)

ian.follow(james.username)
ian.follow(jenn.username)
ian.follow(josh.username)

jenn.follow(ian.username)
jenn.follow(james.username)
jenn.follow(josh.username)

james.follow(ian.username)
james.follow(jenn.username)
james.follow(josh.username)