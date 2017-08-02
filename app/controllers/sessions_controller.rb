class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user
  	else
  		flash.now[:warning] = "Something went wrong..."
  		render 'new'
  	end
  end

  def destroy
  end
end
