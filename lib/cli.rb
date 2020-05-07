class CommandLine
    
    def greet
        puts "Welcome to the Taco Shop!"
        puts "Please enter your name to place an order"
        @name = gets.strip
        @user = User.find_or_create_by(name: @name)
        
    end 
    
    def order
        puts "Would you like to place an order?(y/n)"
        choice = gets.strip
        if choice == "y"
            puts "Great! Please choose a shell"
            shells
            puts "Thank you, now please choose a filling"
            fillings
            puts "Would you like to choose another filling?(y/n)"
            second_choice = gets.strip
            if second_choice == "y"
                fillings
            elsif second_choice == "n"
                puts "Thank you, now please choose a topping"
                    toppings
                puts "Would you like to choose another topping?(y/n)"
                third_choice = gets.strip
                if third_choice == "y"
                    toppings
                    puts "Wonderful! Here is your Taco."
                elsif third_choice == "n" 
                    puts "Here is your Taco! "
                end
            end
        else 
            puts "Thank you, have a nice day"
        end 
    end

    def shells
        shells = Ingredient.where(ingredient_type: 'shell')
        shell = shells.map{|ingredients| ingredients.ingredient_name}
        puts shell
        shell_choice = gets.strip
        @ingredient_id = Ingredient.find_by ingredient_name: shell_choice
        taco = Taco.create(user_id: @user.id, ingredient_id: @ingredient_id.id, order_number: @user.id)
        # hash = Hash.new
        # %w(shell.join(" ")).each_with_index{|item, index|
        # hash[index] = item
        # }
        # puts hash
    end
    
    def fillings
        fillings = Ingredient.where(ingredient_type: 'filling')
        filling = fillings.map{|ingredients| ingredients.ingredient_name}
        puts filling
        filling_choice = gets.strip
        @ingredient_id = Ingredient.find_by ingredient_name: filling_choice
        taco = Taco.create(user_id: @user.id, ingredient_id: @ingredient_id.id, order_number: @user.id)
    end

    def toppings
        toppings = Ingredient.where(ingredient_type: 'toppings')
        topping = toppings.map{|ingredients| ingredients.ingredient_name}
        puts topping
        topping_choice = gets.strip
        @ingredient_id = Ingredient.find_by ingredient_name: topping_choice
        taco = Taco.create(user_id: @user.id, ingredient_id: @ingredient_id.id, order_number: @user.id)
    end
    
end
