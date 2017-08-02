class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thanks for signing up!"
  		redirect_to root_url
  	else
  		flash.now[:warning] = "Something went wrong..."
  		render users_new_path
  	end
  end

  def show
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  																 :password_confirmation)
  	end
end
