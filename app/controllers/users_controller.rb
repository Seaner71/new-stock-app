class UsersController < ApplicationController
  def index
  @users = User.all
end

def show
  @user = User.find_by_id(params[:id])
end

def edit
  find_user
end

def new
end

def create
end

def update
  find_user
  if @user.update(user_params)
    redirect_to user_path(@user), notice: 'Updated your information'
  else
    render 'edit'
  end
end

def destroy
  find_user
  @user.destroy
    redirect_to root_path
end

private

def get_user
  @user = current_user
end

def find_user
  @user = User.find_by_id(params[:id])
end

def user_params
  params.require(:user).permit(:username)
end

end
