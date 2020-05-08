# class CommandLineInterface

#     def hello
#         system "clear"
#         puts "🧸----------------------------🧸".blue
#         puts "| Hello Welcome to Litthe Math |".blue.blink
#         puts "🧸----------------------------🧸".blue
#     end
    
#     def greeting

#         puts "\n📗A game designed to teach 📕".bold.underline
#         puts "\n📗Basic Math Skills 📕".bold.underline
#         puts "\n📗to children at preschool age.📕".bold.underline

#         puts
#         puts "➕ ➖ ➕ ➖ ➕ ➖ ➕ ➖ ➕ ➖➕"
#         puts "📕Are you exited to get started?📗".blue.on_white.bold
#         puts "➕ ➖ ➕ ➖ ➕ ➖ ➕ ➖ ➕ ➖➕"
#         # puts "\n🐾🐾 First Let's Create an Account For you! 🐾🐾".white.on_light_blue.bold
#         puts
#     end

#     def check
#         puts "First let's check if you have an account wiht us".bold
#         puts
#         puts "press: 1".blue.on_white.bold + " if you have an account"
#         puts "press: 2".blue.on_white.bold + " to create an account"
#         num = gets.chomp
#         if num == "1"
#             puts "What is your username?"
#             username = gets.chomp
#             puts "Welcome back #{username}!"
#             @exist = User.all.find_by(user_name: username)
#             menu
#         elsif num == "2"
#             create_account
#         end
#         @exist
#     end

#     def create_account
#         puts "What do you want your username to be?"
#         user_name = gets.chomp
#         puts "Cool #{user_name}! How old are you?"
#         age = gets.chomp
#         puts "Awesome! Do you have a favorite animal? What is it?"
#         favorite_animal = gets.chomp
#         puts "WOW! That's a really cool animal!"

#         @exist = User.find_or_create_by(user_name: user_name, age: age, favorite_animal: favorite_animal)

#         # if user_name == @user_account.user_name
#         #     puts "you already have an account, we will send you to the game menu".red
#         #     menu
#         # end

#         puts "Great! Now you are all set to start a game!"
#     end

#     def view_account
#         # user_name = User.all.map {|user| user.user_name}.last
#         # age = User.all.map {|user| user.age}.last
#         # favorite_animal = User.all.map {|user| user.favorite_animal}.last
#         puts "Your username is #{@exist.user_name}, you are #{@exist.age} years old and your favorite animal is #{@exist.favorite_animal}."
#         menu
#     end

    # def update_account
    #     puts "What is your current username?"
    #     user_name = gets.chomp
    #     puts "What username you want to change to"
    #     new_user_name = gets.chomp
    #     user = User.find_by(user_name: user_name)
    #     user.update(user_name: new_user_name)  
    #     puts "You have changed your username to #{new_user_name}"
    #     menu
    # end

#     def delete_account
#         user = User.all
#         user.last.destroy
#         puts "Your account has been deleted"
#         quit_game
#     end

#     def quit_game
#         puts "goodbye Thank You for playing!"
#     end

#     # MENU
#     # PLAY GAME press1 --> method outputs question
#     # ACCOUNT press2 --> method shows account detailes OPTIONS C-R-U-D
#     # QUIT press3 --> quit program

#     def menu
#         puts "GAME MENU"
#         puts "press 1 to view account info"
#         puts "press 2 to update account info"
#         puts "press 3 to start the game"
#         puts "press 4 to delete an account"
#         puts "press 5 to quit the game"
#         num = gets.chomp
#         if num == "1"
#             view_account
#         elsif num == "2" 
#             update_account
#         elsif num == "3" 
#             game
#         elsif num == "4" 
#             delete_account
#         elsif num == "5"
#             quit_game
#         end
#     end
    
#     def question
#         @correct = nil
#         @wrong = nil
#         question = Question.all
#         random = question.sample
#         puts random.question
#         user_answer = gets.chomp
#         answer = random.answer
#         # need a conditioal statement to check on 
#         # answer with no input or answer with
#         # weird text
#         if user_answer == answer
#             puts
#             puts "great job"
#             puts
#             @correct = true
#         else
#             puts
#             puts "try again"
#             puts random.hint
#             ans = gets.chomp
#             if ans == answer
#                 puts "great job"
#                 @correct = true
#             else
#                 puts "that's not correct, let's move on to the next question!"
#                 @wrong = false
#             end
#         end
#         var = Play.create(user_id: @exist.id, question_id: random.id, correct_answer: @correct||@wrong)

#         user = Play.where(user_id: @exist.id)
#         @correct_score = 0
#         @wrong_score = 0
#         user.select do |s|
#             if s.correct_answer == true
#                 @correct_score += 1
#             elsif s.correct_answer == false
#                 @wrong_score += 1
#             end
#         end
#     end

#     def game
#         i = 0
#         5.times do
#             i += 1
#             puts "Question number: #{i}"
#             question
#         end
#         puts "You did great"
#         puts "you got #{@wrong_score} wrong and #{@correct_score} right"
#         puts "If you want to start over"
#         puts "press: 1"
#         puts "to quit"
#         puts "press: 2"
#         num = gets.chomp
#         if num == "1"
#             menu
#         elsif num == "2"
#             quit_game
#         end
#     end

# end