## TacoTruck 
TacoTruck is a Command Line application written for Ruby that allows users to make virtual tacos. 

## Getting Started 
After you git clone this to your computer, you should run rake db:migrate, and rake db:seed in order to populate the taco database. In order to open the application, run "ruby bin/run.rb" in your terminal.

## Description
In this project, we built a project in which a customer will build a taco through an app. TacoTruck will will show them their choices for shells, fillings, and toppings. 

## Process to Build 
1. A user has many tacos, many ingredients through taco ingredients, and many taco ingredients through tacos
2. A taco belongs to a user and has many ingredients through taco ingredients
3. An ingredient has many taco ingredients, users through tacos, and tacos through taco ingredients
4. A taco ingredient belongs to taco and ingredient

## Customer
1. Enter the name 
2. If customer wishes to order, first choose a shell. 
3. Choose 2 fillings, like carne asada and chicken. 
4. Choose 3 toppings, such as sauces. 
5. Look back and see if the customer wants to change something in taco order
6.If customer decides not to order, exit the application. 

## Contributions
Built by Maggie Cooper and Darrick Pang
