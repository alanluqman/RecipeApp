class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods = Food.where(author_id: @user.id)
  end

  def show; end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    # debugger
    @user = User.find(params[:user_id])
    new_food = @user.foods.new(food_data)
    if new_food.save
      redirect_to user_foods_path(user_id: @user.id)
    else
      p 'Food was not created'
    end
  end

  def update; end

  def destroy; end

  private

  def food_data
    params.permit(:name, :measurement_unit, :quantity, :price)
  end
end
