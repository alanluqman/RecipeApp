class RecipeFoodsController < ApplicationController
  def index; end

  def show; end

  def new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    new_ingredient = @recipe.recipe_foods.new(params_data)

    if new_ingredient.save
      redirect_to user_recipe_path(user_id: @user.id, id: @recipe.id)
    else
      p 'ingredient was not created'
    end
  end

  def update; end

  def destroy; end

  private

  def params_data
    params.permit(:food_id, :quantity)
  end
end
