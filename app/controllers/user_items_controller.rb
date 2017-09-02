class UserItemsController < ApplicationController
	before_action :redirect_to_login

  def create
  	@user_item = current_user.user_items.build(user_item_params)
  	if @user_item.save
  		#flash.now[:success] = @user_item.name + " has been added to '#{@user_item.category.name}'"
  		# add item to list under proper category
  	else
  		flash.now[:warning] = @user_item.errors.full_messages
  	end
  end

  def destroy
  end

  def update
  end

  private
    def user_item_params
      params.require(:user_item).permit(:name, :price, :category_id)
    end
end
