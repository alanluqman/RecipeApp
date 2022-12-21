class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.where(public: false, author_id: @user.id )
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
