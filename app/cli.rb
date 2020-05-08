class CommandLineInterface
    attr_reader :prompt, :font
    $pastel = Pastel.new
    
    def initialize()
        @prompt = TTY::Prompt.new(active_color: :green)
        @font = TTY::Font.new(:straight)
    end

    def greeting
        system "clear"
        puts
        puts font.write("HELLO!").blue.blink
        puts "----------------------------------------".cyan.bold
        puts "| 🧸 WELCOME TO THE LITTLE MATH LAB 🧸 |".cyan.bold
        puts "----------------------------------------".cyan.bold
        puts
        puts "✏️  A Basic Math Exercise for Children at Preeschool Age ✏️".bold
        puts
        puts "Are you exited to get started?\n".blue.on_white.bold
        prompt.keypress("Press ENTER to continue!".cyan, keys: [:return])
        check_account
    end

    def check_account
        system "clear"
        puts "First, are you already a part of Little Math Lab community?".cyan.bold
        prompt.select("Select One Option".underline) do |menu|
            menu.choice "I've been here before",-> { 
                puts "Great! What is your username?".blue 
                username = gets.chomp
                puts "Welcome back, #{username}!".blue
                @exist = User.all.find_by(user_name: username)
            }
            menu.choice "This is my first time",-> { 
                puts "Alright, let's Create an Account For you!".bold
                create_account 
            }
        end
        prompt.keypress("Press ENTER to continue!".underline, keys: [:return])  
        menu
    end

    def create_account
        puts "What do you want your username to be?".blue
        user_name = gets.chomp
        puts "Nice to meet you, #{user_name}! How old are you?".blue
        age = gets.chomp
        puts "Awesome! Do you have a favorite animal? What is it?".blue
        favorite_animal = gets.chomp
        puts "WOW! That's a really cool animal!".blue
        puts "\nNow you are all set!\n".green
        
        @exist = User.find_or_create_by(user_name: user_name, age: age, favorite_animal: favorite_animal)

        prompt.keypress("Press ENTER to continue!".underline, keys: [:return])  
        menu
    end

    def update_account
        prompt.select("Select One Option".underline) do |menu|
            menu.choice 'Update My Username', -> {
                puts "What will your new username be?".blue
                new_user_name = gets.chomp
                puts "You have successfully changed your username to #{new_user_name}.".green
                @exist.update(user_name: new_user_name)
                my_account
            }
            menu.choice 'Update My Age', -> {
                puts "What is your age?".blue
                new_age = gets.chomp
                puts "You are now #{new_age} years old!".green
                @exist.update(age: new_age)
                my_account
            }
            menu.choice 'Update My Animal', -> {
                puts "It's alright, people change their mind, what is your new favorite animal now?".blue
                new_animal = gets.chomp
                puts "Your new favorite animal is #{new_animal}.".green
                @exist.update(favorite_animal: new_animal)
                my_account
            }
        end  
        prompt.keypress("Press ENTER to go back to the main menu".underline, keys: [:return])  
        menu
    end

    def view_account
        puts "Your username is #{@exist.user_name}, you are #{@exist.age} years old, and your favorite animal is #{@exist.favorite_animal}.".blue.bold
        prompt.keypress("Press ENTER to go back to the main menu".underline, keys: [:return])
        menu
    end

    def delete_account
        user = User.find_by(user_name: @exist.user_name)
        user.destroy
        puts "Your account has been deleted".green
        puts "GOODBYE"
    end

    def my_account
        prompt.select("Select One Option".underline) do |menu|
            menu.choice 'View My Account', -> { view_account }
            menu.choice 'Update My Account', -> { update_account }
            menu.choice 'Delete My Account', -> { delete_account }
        end
        prompt.keypress("Press ENTER to go back to the main menu".underline, keys: [:return])  
        menu
    end

    def menu
        system "clear"
        puts "MAIN MENU".bold
        prompt.select("Select One Option".underline) do |menu|
            menu.choice 'MY ACCOUNT', -> { my_account }
            menu.choice 'PLAY GAME', -> { game }
            menu.choice 'QUIT GAME', -> { quit_game }
        end
    end

    def quit_game
        system "clear"
        puts "WE HOPE TO SEE YOU AGAIN SOON!".bold
        puts "........... GOODBYE ...........".bold
        puts "...............................".bold
    end
    
    def question
        @correct = nil
        @incorrect = nil
        question = Question.all
        random = question.sample
        puts random.question
        user_answer = gets.chomp
        answer = random.answer
        if user_answer == answer
            puts "Good Job!".green
            @correct = true
        else
            puts
            puts "Try Again!".red
            puts random.hint
            answer_2 = gets.chomp
            if answer_2 == answer
                puts "Great Job".green
                @correct = true
            else
                puts "That's not correct! Let's move on to the next question!".red
                @incorrect = false
            end
        end
        plays = Play.create(user_id: @exist.id, question_id: random.id, correct_answer: @correct||@incorrect)

        play_user = Play.where(user_id: @exist.id)
        @correct_score = 0
        @incorrect_score = 0
        play_user.select do |p|
            if p.correct_answer == true
                @correct_score += 1
            elsif p.correct_answer == false
                @incorrect_score += 1
            end
        end
    end

    def game
        i = 0
        5.times do
            i += 1
            puts "Question Number: #{i}".blue.on_light_cyan
            question
        end
        puts "\nYou did great!".magenta.bold
        puts
        puts "You got #{@correct_score} correct, and #{@incorrect_score} incorrect.".light_blue.on_light_green
        puts "\nKEEP UP THE GOOD WORK!\n".magenta.bold
        prompt.keypress("Press ENTER to go back to the main menu".underline, keys: [:return])
        menu
    end

end