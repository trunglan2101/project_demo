class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_index_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_index_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy(user_params)
    redirect_to users_index_path
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :name, :email, :admin)
  end
end
