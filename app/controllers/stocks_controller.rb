class StocksController < ApplicationController
  def index
    @account = Account.find_by_id(params[:id])
    @stocks = @account.stocks.all
  end
  def new
    get_account
    @stock = Stock.new
  end
  def create
    get_account
    @stock = @account.stocks.new(stock_params)
    @stock.user_id = current_user.id
    @stock.sname = StockQuote::Stock.quote(params['stock'][:ticker]).sname
    @stock.name = StockQuote::Stock.quote(params['stock'][:ticker]).name
    @stock.price = StockQuote::Stock.quote(params['stock'][:ticker]).l.gsub(/[^\d^\.]/, '').to_f
    if @stock.save
      redirect_to account_path(@account)
    end
  end
  def show
    get_account
    get_stock
    @stock_quote = StockQuote::Stock.quote(@stock.ticker)
    # @stock_test_hash = Hash[@account.stocks.group(:sname).sum(:shares).map { |k, v| [k, v * 5] }]
    @logo = @stock.get_logo
    @financials = @stock.get_financials
  end
  def edit
    get_account
    get_stock
  end

  def update
    get_account
    get_stock
    @stock.update(stock_params)
    redirect_to account_stock_path(@stock)
  end

  def destroy
    get_account
    get_stock
    @stock.destroy
      redirect_to accounts_path
  end
  private

  def get_account
    @account = Account.find_by_id(params[:account_id])
  end

  def get_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:ticker, :shares, :sname, :name, :price)
  end

end
