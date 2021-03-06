# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do |n|
# title = Faker::Games::Pokemon.name
# description = Faker::Book.title
# user_id = rand(1..10)
# Task.create!(
# title: title,
# description: description,
# term: Faker::Time.between(10.years.ago, 0.years.ago, :all).to_s[0, 10],
# user_id: user_id
# )
# end

10.times do |_n|
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create!(
    name: name,
    email: email,
    password: 'password'
  )
end

User.create!(
  id: 11,
  name: 'Admin',
  email: 'sample@test.com',
  password: 'password',
  role: 1
)

Group.create!(
  id: 1,
  name: 'テストグループ',
  user_id: 11
)

10.times do |_t|
  title = Faker::Games::Pokemon.name
  description = Faker::Book.title
  Task.create!(
    title: title,
    description: description,
    term: Faker::Time.between(10.years.ago, 0.years.ago, :all).to_s[0, 10],
    user_id: 11,
    group_id: 1
  )
end

Member.create!(
  user_id: 11,
  group_id: 1
)
