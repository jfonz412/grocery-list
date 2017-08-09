class ListsController < ApplicationController
  before_action :redirect_to_login

  def new
    @list = List.new
  end

  def create
    @list = List.new(name: list_params[:name], user_id: current_user.id)
    if @list.save
      params[:list][:list_item].each do |l|
        @list.list_items.create(user_item_id: l[:user_item_id])
      end
      redirect_to root_url
    else
      flash[:warning] = @list.errors.full_messages
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def edit
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
