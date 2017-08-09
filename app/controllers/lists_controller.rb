class ListsController < ApplicationController
  before_action :log_in_user

  def new
  	@list = List.new
  end

  def create

  end

  def index
  end

  def show
  end

  def edit
  end

  private
    # can probably move to helper in the near future
    def log_in_user
      if !logged_in?
        redirect_to login_path
      end
    end 
end
