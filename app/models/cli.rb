class CliMessages

    def greeting_message
        puts "welcome to cli game #{NAME} for children getting ready for their first school"
        # this game is designed to help children exercise their knowledge of math
    end

    def ask_name_age_favorite_animal
        # Hello! please enter your name
        # nice to meet you #{name} how old are you?
        # great I bet you are a very smart #{age} old #{name}
        # what is your favorite animal #{name}?
        # that is a cool animal
        # I dont think thats an animal but good try
    end

    def menu
        # this is our game menu
        # here you can view your account, change your name, age or fav animal
        # you can also delete the acount

        # press 1 to start the game and try the first exercise
        # press 2 to update your account
        # press 3 to delete account
        # press 4 to quit the game.
    end

    def update_account
        # brings the user back to the method
        ask_name_age_favorite_animal
    end

    def delete_account
        
    end

    def quit_game
        # goodbye
    end




end