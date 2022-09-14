class ShoppingListController < ApplicationController
  def index
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @foods = current_user.foods
    @recipes = current_user.recipes
    @recipes.includes(:recipe_foods).each do |recipe|
      recipe.recipe_foods.map do |food|
        @recipe_foods << food
      end
    end
    @recipe_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
  end
end
