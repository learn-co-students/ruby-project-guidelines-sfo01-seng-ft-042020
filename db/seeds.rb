# use faker to manually create seed data that is both random and makes sense for our domain models

# EXAMPLE
# User.create(name: Faker::Name.name)
# Restaurant.create(name: Faker::Company.name)
# Review.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, content: Faker::Hacker.say_something_smart)


# Your goal is to make sure you have enough data to play around with once you get your command line interface up and running. Five to ten instances of each model, as well as the corresponding relationships should be enough. You can always add more later.

# Once your file is ready, run rake -T to see which rake task you can use to seed your database.