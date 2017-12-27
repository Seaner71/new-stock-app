class StocksController < ApplicationController
  def index
    @account = Account.find_by_id(params[:id])
    @stocks = @account.stocks.all
  end
  def new
    @stock = Stock.new
  end
  def create
    get_account
    @stock = @account.stocks.new(stock_params)
    @stock.user_id = current_user.id
    if @stock.save
      redirect_to account_path(@account)
    end
  end
  def show
  end
  private

  def get_account
    @account = Account.find_by_id(params[:account_id])
  end

  def get_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:ticker, :shares, :sname, :name)
  end
end
