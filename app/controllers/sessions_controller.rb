class SessionsController < ApplicationController
  def new
  end

	def create
    byebug
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
			flash.new[:danger] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
