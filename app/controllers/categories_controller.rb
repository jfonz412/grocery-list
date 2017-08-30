class CategoriesController < ApplicationController
  def create
  	category = current_user.categories.build(category_params)
  	if category.save
  		render 'new'
  	else
  		flash.now[:warning] = category.errors.full_messages
  	end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
