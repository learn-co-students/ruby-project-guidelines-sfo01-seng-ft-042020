class CommandLine
    
    def greet
        puts "Welcome to the Taco Shop!"
        puts "Please enter your name to place an order"
        name = gets.strip
        user = User.create(name: name)
        
    end 
    
    def order
        puts "Would you like to place an order?(y/n)"
        choice = gets.strip
        if choice == "y"
            puts "order here"
        else 
            puts "Thank you, have a nice day"
        end 
    end
    
end
