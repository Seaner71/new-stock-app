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
   def get_news
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/news/last/5")
     JSON.parse(response.body)
   end
end
