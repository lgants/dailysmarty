# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |topic|
	Topic.create!(title: "My Title #{topic}")
end

puts "100 Topics created"

AdminUser.create!(
		email: "admin@test.com",
		password: "asdfasdf",
		password_confirmation: "asdfasdf",
		first_name: "Jon",
		last_name: "Snow",
		username: "wallwatcher",
	)

puts "Admin user created"

User.create!(
		email: "student@test.com",
		password: "asdfasdf",
		password_confirmation: "asdfasdf",
		first_name: "Jon",
		last_name: "Snow",
		username: "youngwallwatcher",
	)

puts "Student user created"

50.times do |post|
	Post.create!(
	  title: "My Post #{post}",
	  content: "Some amazing content here",
	  topic_id: Topic.last.id,
	  user_id: User.last.id
	)
end

puts "50 posts were created"
