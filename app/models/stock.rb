class Stock < ApplicationRecord
  belongs_to :account
  belongs_to :user
  # validates :ticker, uniqueness: true
  validates :ticker, presence: true, length: { maximum: 6 }
  before_save :upcase_fields
  scope :sorted, lambda {order(ticker: :asc)}

   def upcase_fields
      self.ticker.upcase!
   end

   #TODO create variable for prefix https://api.iextrading.com/1.0
   #TODO create variable for JSON.parse(response.body)
   # performs the GET request to get the quote from IEX
   def get_quote
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote")
     JSON.parse(response.body)
   end
   # performs the GET request to get the chart from IEX
   def get_chart(time = '1m')
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/chart/#{time}")
     JSON.parse(response.body)
   end
   # performs the GET request to get the logo from IEX
   def get_logo
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/logo")
     return logo = JSON.parse(response.body)['url']
   end
   # performs the GET request to get the 5 most recent news stories from IEX
   def get_news
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/news/last/5")
     JSON.parse(response.body)
   end

   ## performs the GET request to get Financial Information
   #TODO break this method iinto several to get particular finacial Information
   def get_financials
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/financials")
     JSON.parse(response.body)
   end
end

## Format for Revenue expense charts - will use on Stock show when get the data in

=begin
<%= bar_chart [
  {name: "Revenue", data: {"2017-09-30"=>52579000000, "2017-06-30"=>45408000000, "2017-03-31"=>52896000000, "2016-12-31"=>78351000000}},
  {name: "Expenses", data: {"2017-09-30"=>32579000000, "2017-06-30"=>25408000000, "2017-03-31"=>22896000000, "2016-12-31"=>48351000000}},
  {name: "Net Income", data: {"2017-09-30"=>22579000000, "2017-06-30"=>25408000000, "2017-03-31"=>32896000000, "2016-12-31"=>38351000000}}]
  %>
=end
