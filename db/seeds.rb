# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# users = User.create([
#    {email: "test@email.com", password: "test", username: "test_account", age: 25, skype_username: "test.1532.skype", first_name: "John", last_name: "Doe"}
# ])

#Users
10.times do
   User.create(
      email: Faker::Internet.email,
      password: "test",
      username: Faker::Internet.username,
      age: rand(0..100),
      skype_username: Faker::Internet.username,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
   )
end

#Languages
english = Language.create(
   name: "english",
   wikipedia_link: "https://en.wikipedia.org/wiki/English_language",
   approved: true,
   pitched: false,
   gendered: false
)

french = Language.create(
   name: "french",
   wikipedia_link: "https://en.wikipedia.org/wiki/French_language",
   approved: true,
   pitched: false,
   gendered: false
)

spanish = Language.create(
   name: "spanish",
   wikipedia_link: "https://en.wikipedia.org/wiki/Spanish_language",
   approved: true,
   pitched: false,
   gendered: false
)

german = Language.create(
   name: "german",
   wikipedia_link: "https://en.wikipedia.org/wiki/German_language",
   approved: true,
   pitched: false,
   gendered: false
)

#Flags
united_kingdom = Flag.create(
   nationality: "english",
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/United_Kingdom"
)

united_states = Flag.create(
   nationality: "american",
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/United_States"
)

france = Flag.create(
   nationality: "french",
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/France"
)

spain = Flag.create(
   nationality: "spanish",
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/Spain"
)

germany = Flag.create(
   nationality: "german",
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/Germany"
)