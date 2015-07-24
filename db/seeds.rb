# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             admin: true)

24.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  
  User.create!(name:  name,
               email: email)
end

users = User.order(:created_at).take(6)
3.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[1..9]
followers = users[2..8]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

