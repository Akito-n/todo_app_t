# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10000.times do |n|
  title = Faker::Games::Pokemon.name
  description = Faker::Book.title
  Task.create!(
    title: title,
    description: description,
    term: Faker::Time.between(10.years.ago, 0.years.ago, :all).to_s[0, 10]
  )
end
