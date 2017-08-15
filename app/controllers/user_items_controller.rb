class UserItemsController < ApplicationController
  def create
  	#create new item without reloading page
  end

  def destroy
  end

  def update
  end

  private
	  def item_params
      	params.require(:user_item).permit(:name, :price)
	  end
end
