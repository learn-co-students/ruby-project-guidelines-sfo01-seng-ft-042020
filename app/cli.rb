class CommandLineInterface

    def greeting
        puts "Hello! Welcome to Basic Math Game for Preschoolers!\n\n"
        puts "A game which is designed to help children exercise their knowledge of math.\n\n"
        puts "We can see you are exited to get started\n\n"
        puts "First Let's Create an Account For you!"
    end

    def create_account
        puts "What do you want your username to be?"
        name = gets.chomp
        puts "Cool #{name}! How old are you?"
        age = gets.chomp
        puts "Awesome! Do you have a favorite animal? What is it?"
        favorite_animal = gets.chomp
        puts "WOW! That's a really cool animal!"

        user_ac = User.find_or_create_by(name: name, age: age, favorite_animal: favorite_animal)

        puts "Great! Now you are all set to start a game!"
    end

    def view_account
        name = User.all.map {|u| u.name}.last
        age = User.all.map {|u| u.age}.last
        animal = User.all.map {|u| u.favorite_animal}.last
        puts "Your username is #{name}, you are #{age} years old and your favorite animal is #{animal}."
        menu
    end

    def update_account
        puts "What is your current username?"
        name = gets.chomp
        puts "What username you want to change to"
        new_name = gets.chomp
        user = User.find_by(name: name)
        user.update(name: new_name)  
        puts "You have changed your name to #{new_name}"
        menu
    end

    # MENU
    # PLAY GAME press1 --> method outputs question
    # ACCOUNT press2 --> method shows account detailes OPTIONS C-R-U-D
    # QUIT press3 --> quit program

    def menu
        puts "GAME MENU\n\n"
        puts "press 1 to view account info"
        puts "press 2 to update account info"
        puts "press 3 to start the game"
        puts "press 4 to delete an account"
        puts "press 5 to quit the game"
        num = gets.chomp
        if num == "1"
            view_account
        elsif num == "2" 
            update_account
        elsif num == "3" 
            game
        elsif num == "4" 
            delete_account
        elsif num == "5"
            quit_game
        end
    end

    def quit_game
        puts "goodbye Thank You for playing!"
    end

    def delete_account
        user = User.all
        user.last.destroy
        puts "Your account has been deleted"
        quit_game
    end
    
    def question
        q = Question.all
        q2 = q.sample
        puts q2.question
        num = gets.chomp
        num_int = num
        answer = q2.answer
        # need a conditioal statement to check on 
        # answer with no input or answer with
        # weird text
        if num_int == answer
            puts
            puts "great job"
            puts
        else
            puts
            puts "try again"
            puts q2.hint
            ans = gets.chomp
            if ans == answer
                puts "great job"
            else
                puts "that's not correct, let's move on to the next question!"
            end
        end
    end

    def game
        i = 0
        5.times do
            i += 1
            puts "Question number: #{i}"
            question
        end
        puts "You did great"
        puts "If you want to start over"
        puts "press: 1"
        puts "to quit"
        puts "press: 2"
        num = gets.chomp
        if num == "1"
            menu
        elsif num == "2"
            quit_game
        end
    end
    


# I dont think thats an animal but good try
end