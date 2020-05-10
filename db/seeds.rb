# User.create(name: Faker::Name.name)
# Restaurant.create(name: Faker::Company.name)
# Review.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, content: Faker::Hacker.say_something_smart)

# Your goal is to make sure you have enough data to play around with once you get your command line interface up and running. Five to ten instances of each model, as well as the corresponding relationships should be enough. You can always add more later.

# Once your file is ready, run rake -T to see which rake task you can use to seed your database.

Question.destroy_all
User.destroy_all
Play.destroy_all

q1 = Question.create(question: "2 + 2", answer: "4", hint: "Hint: Use your fingers to help count!")
q2 = Question.create(question: "0 + 0", answer: "0", hint: "Hint: Zero is nothing, so what is nothing plus nothing!")
q3 = Question.create(question: "5 + 1", answer: "6", hint: "Hint: Use your fingers to help count!")
q4 = Question.create(question: "9 - 6", answer: "3", hint: "Hint: Use near by objects to help count!")
q5 = Question.create(question: "3 + 2", answer: "5", hint: "Hint: Use your favorite toys to help count!")
q6 = Question.create(question: "4 + 3", answer: "7", hint: "Hint: Use near by objects to help count!")
q7 = Question.create(question: "4 - 4", answer: "0", hint: "Hint: You have 4 apples, you share all of them to your mom, how many do you have left?")
q8 = Question.create(question: "7 - 5", answer: "2", hint: "Hint: Use your fingers to help count!")
q9 = Question.create(question: "10 - 2", answer: "8", hint: "Hint: All fingers come up and count! How many fingers do you have? Now put down 2 of them and count again!")
q10 = Question.create(question: "3 - 2", answer: "1", hint: "Hint: Use your favorite toys to help count!")
q11 = Question.create(question: "1 + 2", answer: "3", hint: "Hint: You have 1 ball, and mom gives you 2 more!")
q12 = Question.create(question: "3 + 1", answer: "4", hint: "Hint: You have 3 balls, and friend gives you 1 more!")
q13 = Question.create(question: "8 + 2", answer: "10", hint: "Hint: There are 8 crayons in the basket, now add 2 more crayons to the basket, let's count crayons in the basket together!")
q14 = Question.create(question: "1 2 3 4 5 6 ? What number comes after 6?", answer: "7", hint: "Hint: Set a paper and a pen, write all numbers from 1 to 10")
q15 = Question.create(question: "1 2 3 ? what number comes after 3?", answer: "4", hint: "Hint: Set a paper and a pen, write all numbers from 1 to 10")

milo = User.create(user_name: "MiloGrey", age: 4, favorite_animal: "bear")
thorin = User.create(user_name: "ThorinWilder0916", age: 4, favorite_animal: "dinosaur")
rad = User.create(user_name: "Rad", age: 5, favorite_animal: "penguin")
dream = User.create(user_name: "Dreamy1115", age: 5, favorite_animal: "cow")
gigi = User.create(user_name: "Gigi888", age: 3, favorite_animal: "bee")

Play.create(user_id: milo.id, question_id: q1.id, correct_answer: true)
Play.create(user_id: milo.id, question_id: q2.id, correct_answer: true)
Play.create(user_id: milo.id, question_id: q3.id, correct_answer: false)
Play.create(user_id: milo.id, question_id: q4.id, correct_answer: true)
Play.create(user_id: milo.id, question_id: q5.id, correct_answer: false)
Play.create(user_id: thorin.id, question_id: q1.id, correct_answer: true)
Play.create(user_id: thorin.id, question_id: q2.id, correct_answer: true)
Play.create(user_id: thorin.id, question_id: q3.id, correct_answer: false)
Play.create(user_id: thorin.id, question_id: q4.id, correct_answer: true)
Play.create(user_id: thorin.id, question_id: q5.id, correct_answer: false)
