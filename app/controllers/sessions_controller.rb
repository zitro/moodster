class SessionsController < ApplicationController
  def new
  end

	def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
			flash.now[:danger] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
		File.delete('./app/assets/images/plzwork.jpg') if File.exist?('./app/assets/images/plzwork.jpg')
    redirect_to '/'
  end
end
