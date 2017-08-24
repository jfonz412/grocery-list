class ListsController < ApplicationController
  before_action :redirect_to_login

  def new
    @list = List.new
  end

  def create
    @list = List.new(name: list_params[:name], user_id: current_user.id)
    if @list.save
    	build_list_items
    	build_user_items
      flash[:success] = "List created!"
      redirect_to lists_show_path(@list)
    else
      flash.now[:warning] = @list.errors.full_messages
      render 'new'
    end
  end

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find_by(id: params[:format]) # not sure why this isn't id by default
    #debugger
  end

  def edit
    @list = List.find_by(id: params[:format])
  end

  def update
  end

  def destroy
  end

  private
    def list_params
      params.require(:list).permit(:name, :list_item => [:user_item_id, :quantity],
      																		:user_item => [:category_id, :name, 
                                                         :price, :quantity])
    end

  def build_list_items
		unless params[:list][:list_item].nil?
			params[:list][:list_item].each do |l|
				@list.list_items.create(user_item_id: l[:user_item_id], quantity: l[:quantity])
			end
		end
	end

	def build_user_items
		unless params[:list][:user_item].nil?
			params[:list][:user_item].each do |u|
				item = current_user.user_items.create(name: u[:name], price: u[:price], category_id: u[:category_id])
        @list.list_items.create(user_item_id: item.id, quantity: u[:quantity])
			end
		end
	end
end
