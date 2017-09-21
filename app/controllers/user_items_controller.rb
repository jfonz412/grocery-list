class UserItemsController < ApplicationController
	before_action :redirect_to_login

  def create
  	@user_item = current_user.user_items.build(user_item_params)
  	if @user_item.save
  		#flash.now[:success] = @user_item.name + " has been added to '#{@user_item.category.name}'"
  		@list = List.new
      render 'new'
  	else
  		flash.now[:warning] = @user_item.errors.full_messages
  	end
  end

  def index
  end

  # not currently used
  def destroy
    #@user_item = UserItem.find(params[:user_item_id])
    #@user_item.destroy
  end

  def edit
  end

  def update
    @user_item = UserItem.find(params[:user_item_id])
    @user_item.update_attribute(:included, false)
    render 'remove_row'
  end

  private
    def user_item_params
      params.require(:user_item).permit(:name, :price, :category_id)
    end
end
