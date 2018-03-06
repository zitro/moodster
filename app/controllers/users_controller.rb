class UsersController < ApplicationController

	def index
	@users = User.all
	end

	def new
	  @user = User.new
	end

	def create
	  if user_params[:password] == user_params[:password_confirmation]
	    @user = User.new(user_params)
	    @user.save
	    session[:user_id] = @user.id
	    redirect_to user_path(@user)
	  else
	    redirect_to '/signup'
	  end
	end

  def show
    @user = User.find(params[:id])
  end
	
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.delete
  #   redirect_to root_path
  # end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
