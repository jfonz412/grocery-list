class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user
  		flash[:success] = "Successfully logged in!"
  		redirect_to root_url
  	else
  		flash.now[:warning] = "Something went wrong..."
  		render 'new'
  	end
  end

  def destroy
  end
end
