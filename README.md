# README

This README will describe how I have constructed the Bambank project.
The task is to create a Rails app that will provide a bank platform for users so they can 
create an account, view their balance and perform transactions to other users.

* Ruby version  
The project has been developed with Ruby 2.4.1 and Rails 5.1.6

* Gems used  
	* Devise 4.5.0 for the authentication
	* Bootstrap-sass 3.3.7 and Jquery-rails for styling the pages

* Configuration  
After cloning the repository, you may need to run the following command at the root directory:
	```ruby
	bundle install
	```

* Database set up  
Following are the steps to set up the database(from the root directory):
	```ruby
	bin/rails db:create
	bin/rails db:migrate
	```

* Run test suite
To run the tests, run the following command from the root directory:
	```ruby
	bin/rails test
	```
I have mainly focused the test on the transaction part as it is the core of the platform and
comes from myself. 
The authentication plugin is fully tested so I chose to focus my time on the transaction.

* Description of my approach  
After reading the test description, I have first thinking about the data model.
I have quickly highlighted 3 models: User, Account and Transaction that will describe the
application.
Then I have started setting up the app by creating the database, the migration file and the model.
Finally, I have worked on the controller and the views.

* Model description  
I choose to define 3 models that will be describe the behavior of the application.
	* User Model  
	The user model is responsible for keeping track of users of the platform.
	It has been created for the Devise plugin.
	It stores email, password and a lot of informations used by Devise.

	* Account Model  
	The account model is responsible for linking a user with his balance.
	It stores a user id and an account balance.
	There is a has_many and belongs_to association between User and Account which means
	1 user owns 1 and only one account. This choice has been made in order to get easily
	a user(or an account) from an acount(or a user) and make sure the data is consistent between
	these 2 models.

	* Transaction Model  
	The transaction model is responsible of one transaction of the Bambank.
	It stores a from_id, a to_id, and an amount.
	There is a belongs_to association between Transaction and Account on the from_id and to_id attribute
	which means the from_id needs to be an existing account_id and same for to_id. This choice makes sense
	as we have to make sure that the transaction is well-formed. Also, it is easier to get informations from
	the receiver and sender with this association.

* Controller description  
There is 3 main controllers that get the data from the model: (Actually, you can see that the code source has 4 controllers because
I let the account controller only for eventual improvements of the platform such as an admin dashboard.)
	* Application controller which secures all his sub-controllers with the devise function ```authenticate_user!```
	* Transactions controller which creates a transaction, display all transactions(not used right now but could be helpful for future improvements)
	* Homes controller which collect required data for the home dashboard

* View description  
Concerning the view, there are 3 main parts:
	* Devise views already there with the plugin. It provides all the required views for a proper login feature.(sign in, sign up, etc..) 
	* Dashboard view that renders the current balance and the transactions of the user split by receiver or sender.
	* Transaction view to create a new transaction

* Future improvements
I have been thinking about future improvements on the platform that could increase the user experience and bring more users:
	* An admin part to manage users, accounts and transactions. This improvement would be primary on my point of view as
	it is essential to see wht is happening, eventually fix things manually that did not go well.(See Cancancan plugin for the roles administration)
	* A feature to make a transaction to multiple users, for example when a group of friends makes many transactions after a vacation where
	they have split the cost.
	* Obviously, the UI/UX needs improvements as I have implemented basic views. 
	* A feature to deposit and withdraw Bambeuros as a real bank do.