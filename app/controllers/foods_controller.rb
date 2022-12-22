class FoodsController < ApplicationController
  def index
    @foods = Food.where(author_id: current_user.id)
  end

  def show; end

  def new; end

  def create
    new_food = current_user.foods.new(food_data)
    if new_food.save
      redirect_to user_foods_path(user_id: current_user.id)
    else
      p 'Food was not created'
    end
  end

  def update; end

  def destroy
    food = Food.includes(:recipe_foods).find(params[:id])
    food.recipe_foods.each(&:destroy)
    if food.destroy
      redirect_to user_foods_path(user_id: current_user.id)
    else
      p 'food does not deleted !'
    end
  end

  private

  def food_data
    params.permit(:name, :measurement_unit, :quantity, :price)
  end
end
