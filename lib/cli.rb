class CommandLine

    
    
    def greet
        puts "Welcome to the Taco Shop!"
        puts "Please enter your name below"
        @name = gets.strip
        @user = User.find_or_create_by(name: @name)
        
    end 
    
    def order
        puts "Would you like to place an order?(y/n)"
        choice = gets.strip
        if choice == "y"
            puts "Great! Please choose a shell"
            shells
            puts "Thank you, now please choose a filling. You may choose up to 2 fillings."
            x = 0
            loop do
                fillings
                puts "Would you like to choose another filling?(y/n)"
                second_choice = gets.strip
                x += 1
                if x >= 2 || second_choice == 'n'
                    puts " Please choose your first topping. You may choose up to 3 toppings."
                    break 
                end
            end 
            y = 0
            loop do
                toppings
                puts "Would you like to choose another topping?(y/n)"
                third_choice = gets.strip
                y += 1
                if y == 3 || third_choice == 'n'
                    puts "Thank you here is your taco"
                    puts taco
                    
                    break  
                end 
  
            end 
            puts "Would you like to make a change to your taco? Please choose 'filling,' 'topping', or 'shell."
            fourth_choice = gets.strip 
            if fourth_choice == "filling"
                puts "which ingredient would you like to replace?"
                taco
                @old_ingredient = gets.strip
                # puts "Here is your taco"
                # taco 
                puts "please choose a new filling"
                fillings
                filling_update
                puts "Here is your taco"
                taco
            elsif fourth_choice == "topping"
                puts "which ingredient would you like to replace?"
                taco
                @old_ingredient = gets.strip
                # puts "Here is your taco"
                # taco 
                puts "please choose a new topping"
                toppings
                topping_update
                puts "Here is your taco. Have a nice day :)."
                taco
            elsif fourth_choice == "shell"
                puts "which ingredient would you like to replace?"
                taco
                @old_ingredient = gets.strip
                # puts "Here is your taco"
                # taco 
                puts "please choose a new shell"
                shells
                shell_update
                puts "Here is your taco. Have a nice day :)"
                taco
            else 
                puts "Here is your taco. Have a nice day :)"
                taco
            end
        else 
            puts "Too bad you don't like tacos! Have a taco free day." 
        end 
    end

    def shells
        shells = Ingredient.where(ingredient_type: 'shell')
        shell = shells.map{|ingredients| ingredients.ingredient_name}
        puts shell
        @shell_choice = gets.strip
        @taco = Taco.find_or_create_by(user_id: @user.id, order_number: @user.id)
        ingredient = Ingredient.find_by(ingredient_name: @shell_choice)
        taco_ingredient = TacoIngredient.create(taco_id: @taco.id, ingredient_id: ingredient.id)
        
    end
    
    def fillings
        fillings = Ingredient.where(ingredient_type: 'filling')
        filling = fillings.map{|ingredients| ingredients.ingredient_name}
        puts filling
        @filling_choice = gets.strip
        @taco = Taco.find_or_create_by(user_id: @user.id, order_number: @user.id)
        ingredient = Ingredient.find_by(ingredient_name: @filling_choice)
        taco_ingredient = TacoIngredient.create(taco_id: @taco.id, ingredient_id: ingredient.id)
       
    end

    def toppings
        toppings = Ingredient.where(ingredient_type: 'toppings')
        topping = toppings.map{|ingredients| ingredients.ingredient_name}
        puts topping
        @topping_choice = gets.strip
        @taco = Taco.find_or_create_by(user_id: @user.id, order_number: @user.id)
        ingredient = Ingredient.find_by(ingredient_name: @topping_choice)
        taco_ingredient = TacoIngredient.create(taco_id: @taco.id, ingredient_id: ingredient.id)
       
    end
    
    def taco 
        # binding.pry
        taco_ingredients = @taco.ingredients
        ingredient_names = taco_ingredients.map{ |ingredient| ingredient.ingredient_name}
        
        puts ingredient_names
        # taco.map{|ingredients| ingredients.ing}
    end
    
    def filling_update

        unwanted_ingredient = Ingredient.find_by(ingredient_name: @old_ingredient)
        old_taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: unwanted_ingredient.id)
        new_ingredient = Ingredient.find_by(ingredient_name: @filling_choice)
        taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: new_ingredient.id )
        old_taco.destroy 
        x = taco.update(ingredient_id: new_ingredient.id)
       

    end
    
    def topping_update
        unwanted_ingredient = Ingredient.find_by(ingredient_name: @old_ingredient)
        old_taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: unwanted_ingredient.id)
        new_ingredient = Ingredient.find_by(ingredient_name: @topping_choice)
        taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: new_ingredient.id )
        old_taco.destroy 
        x = taco.update(ingredient_id: new_ingredient.id)

    end

    def shell_update
        unwanted_ingredient = Ingredient.find_by(ingredient_name: @old_ingredient)
        puts "Unwanted Ingredient #{unwanted_ingredient}"
        old_taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: unwanted_ingredient.id)
        puts "Old Taco: #{old_taco}"
        new_ingredient = Ingredient.find_by(ingredient_name: @shell_choice)
        puts "New Ingredient: #{new_ingredient}"
        taco = TacoIngredient.find_by(taco_id: @taco.id, ingredient_id: new_ingredient.id )
        puts "Taco: #{taco}"
        #binding.pry
        old_taco.destroy 
        x = taco.update(ingredient_id: new_ingredient.id)

    end
    
end
