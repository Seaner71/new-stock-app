class Stock < ApplicationRecord
  belongs_to :account
  belongs_to :user
  # validates :ticker, uniqueness: true
  validates :ticker, presence: true, length: { maximum: 6 }
  before_save :upcase_fields

   def upcase_fields
      self.ticker.upcase!
   end

   #TODO create variable for prefix https://api.iextrading.com/1.0
   # performs the GET request to get the quote from IEX
   def get_quote
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote")
     JSON.parse(response.body)
   end
   def get_chart(time = '1m')
     response = RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/chart/#{time}")
     JSON.parse(response.body)
   end
end
