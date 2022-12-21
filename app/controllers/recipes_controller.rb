class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.where(public: false, author_id: @user.id)
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def new; end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @ingrediants = RecipeFood.where(recipe_id: @recipe.id)
  end

  def create
    @user = User.find(params[:user_id])
    new_recipe = @user.recipes.new(params_data)
    if new_recipe.save
      redirect_to user_recipes_path(user_id: @user.id)
    else
      p 'Recipe does not added successfully !'
    end
  end

  def update; end

  def destroy; end

  private

  def params_data
    params.permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
