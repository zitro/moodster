class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  # before_action :get_user, only: [:show, :destroy]


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
	    redirect_to @user
	  else
	    redirect_to '/signup'
	  end
	end

  def show
  end

  def destroy
    @user.delete
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

	# def get_user
	# 	@user = User.find(params[:id])
	# end

	def require_login
    @user = User.find(params[:id])
		return head(:forbidden) unless session[:user_id] == @user.id
	end

end
