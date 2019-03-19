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

 10.times do |n|
   name = Faker::Name.name
   email = Faker::Internet.email
   User.create!(
     name: name,
     email: email,
     password: 'password'
   )
 end
