class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(author_id: current_user.id)
    respond_to do |format|
      format.html
      format.json do
        if user_signed_in?
          render json: @recipes
        else
          render html: 'you are not allowed to see this content.'
        end
      end
    end
  end

  def public_recipes
    @recipes = Recipe.includes(:author, :foods, :recipe_foods).where(public: true)

    respond_to do |format|
      format.html
      format.json do
        if user_signed_in?
          render json: @recipes
        else
          render html: 'you are not allowed to see this content.'
        end
      end
    end
  end

  def make_public
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(public: true)
    redirect_to user_recipes_path(user_id: current_user.id) if @recipe.save
  end

  def make_private
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(public: false)
    redirect_to user_recipes_path(user_id: current_user.id) if @recipe.save
  end

  def shoping
    @recipe = Recipe.includes(:foods, :recipe_foods).find(params[:recipe_id])
    @items = @recipe.foods.length
    @total_price = 0
    @recipe.recipe_foods.each do |ingredient|
      @total_price += ingredient.food.price * ingredient.quantity.to_i
    end
  end

  def new; end

  def show
    @recipe = Recipe.includes(recipe_foods: [:food]).find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:user_id].to_i
          recipe = Recipe.find(params[:id])
          ingredients = RecipeFood.where(recipe_id: recipe.id)
          render json: { recipe:, ingredients: }
        else
          render html: 'you are not allowed to see this content.'
        end
      end
    end
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
