class AccountsController < ApplicationController
  def index
    get_user
    @accounts = Account.all
    @account = Account.new
  end

  def show
    get_account
  end

  def new
    get_user
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
      if @account.save
        redirect_to accounts_path
      else
        render 'new'
      end
  end

  def edit
  end
  def destroy
    get_account
    @account.destroy
      redirect_to accounts_path
  end
  private

  def account_params
    params.require(:account).permit(:name)
  end
  def get_account
    @account = Account.find_by_id(params[:id])
  end

  def get_user
    @user = current_user
  end
end
