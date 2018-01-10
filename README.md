# Stock App
Is a web application for user to track their different stock portfolios. All stock data is obtained from the stock_quote gem
built by Ty Rauber https://github.com/tyrauber/stock_quote. A user can set up multiple accounts and monitor the value of each account,
the percentage of each stock in the account and the percentage of each sector. A user can also get price chsrts fot stocks in their portfolio.

This Stock app was developed in Ruby on Rails 5.1 and requires the installation of the follow non-rails standard gems:
-	gem 'devise'
- gem 'pry'
- gem 'bootstrap', "~> 4.0.0.beta2.1"
-	gem 'jquery-rails'
-	gem 'stock_quote', "~> 1.5", ">= 1.5.4"
-	gem 'wdm'
-	gem "chartkick"

**Run on your computer:**


From your project folder, clone the git repository:

	git clone https://github.com/Seaner71/new-stock-app.git

Open the project folder:

	cd new-stock-app
  Install all dependencies:

	bundle install

Run the application:

	rails server

To see the application in action, open a browser window and navigate to [http://localhost:3000](http://localhost:3000).
