class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new 
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    if @user.save()
        redirect_to root_path
    else 
        render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private 
    def user_params
        params.require(:user).permit(:firstname, :lastname)
    end
end
