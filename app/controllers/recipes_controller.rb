class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: false, author_id: current_user.id)
  end

  def public_recipes
    @recipes = Recipe.includes(:author).where(public: true)
  end

  def new; end

  def show
    @recipe = Recipe.includes(recipe_foods: [:food]).find(params[:id])
  end

  def create
    new_recipe = current_user.recipes.new(params_data)
    if new_recipe.save
      redirect_to user_recipes_path(user_id: current_user.id)
    else
      p 'Recipe does not added successfully !'
    end
  end

  def update; end

  def destroy
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe.recipe_foods.each(&:destroy)
    if @recipe.destroy
      redirect_to user_recipes_path(user_id: current_user.id)
    else
      p 'Recipe does not deleted !'
    end
  end

  private

  def params_data
    params.permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
