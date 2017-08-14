class ListsController < ApplicationController
  before_action :redirect_to_login

  def new
    @list = List.new
  end

  def create
    @list = List.new(name: list_params[:name], user_id: current_user.id)
    if @list.save
      unless params[:list][:list_item].nil?
        params[:list][:list_item].each do |l|
          @list.list_items.create(user_item_id: l[:user_item_id])
        end
      end
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
      params.require(:list).permit(:name, list_item: [:user_item_id])
    end

    def empty_list_items(list)
      list_items = []
      count = current_user.user_items.count
      count.times do |n|
        list_items << list.list_items.build
      end
      list_items
    end
end
