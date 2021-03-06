require 'fileutils'

class UsersController < ApplicationController
  before_action :require_login
	before_action :get_user, only: [:show, :destroy]
  skip_before_action :require_login, only: [:index, :new, :create]

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
    # session[:emo] accessible from here
  end

  def destroy
    @user.delete
		FileUtils.remove_dir("./app/assets/images/#{@user.id}") if Dir.exist?("./app/assets/images/#{@user.id}")
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

	def get_user
		@user = User.find(params[:id])
	end

	def require_login
    @user = User.find(params[:id])
		return head(:forbidden) unless session[:user_id] == @user.id
	end

end

#test
