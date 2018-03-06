class SessionsController < ApplicationController
  def new
		@user = User.new
  end

	def create

    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
			byebug
      redirect_to user_path(@user)
    else
			byebug
      redirect_to login_path
    end
  end

  def destroy
    session.delete :name
    session.delete :password
    redirect_to '/login'
  end
end
