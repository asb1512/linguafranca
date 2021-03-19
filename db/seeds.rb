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



english = ForeignLanguage.create(
   name: "english",
   wikipedia_link: "https://en.wikipedia.org/wiki/English_language",
   approved: true,
   pitched: false,
   gendered: false
)

english = NativeLanguage.create(
   name: "english",
   wikipedia_link: "https://en.wikipedia.org/wiki/English_language",
   approved: true,
   pitched: false,
   gendered: false
)

french = ForeignLanguage.create(
   name: "french",
   wikipedia_link: "https://en.wikipedia.org/wiki/French_language",
   approved: true,
   pitched: false,
   gendered: false
)

french = NativeLanguage.create(
   name: "french",
   wikipedia_link: "https://en.wikipedia.org/wiki/French_language",
   approved: true,
   pitched: false,
   gendered: false
)

spanish = ForeignLanguage.create(
   name: "spanish",
   wikipedia_link: "https://en.wikipedia.org/wiki/Spanish_language",
   approved: true,
   pitched: false,
   gendered: false
)

spanish = NativeLanguage.create(
   name: "spanish",
   wikipedia_link: "https://en.wikipedia.org/wiki/Spanish_language",
   approved: true,
   pitched: false,
   gendered: false
)

german = ForeignLanguage.create(
   name: "german",
   wikipedia_link: "https://en.wikipedia.org/wiki/German_language",
   approved: true,
   pitched: false,
   gendered: false
)

german = NativeLanguage.create(
   name: "german",
   wikipedia_link: "https://en.wikipedia.org/wiki/German_language",
   approved: true,
   pitched: false,
   gendered: false
)


united_kingdom = Flag.create(
   nationality: "english"
   approved: true,
   wikipedia_link: "https://en.wikipedia.org/wiki/United_Kingdom"
)