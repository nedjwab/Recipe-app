class ShoppingListController < ApplicationController
  def index
    @allrecipes = current_user.recipes.includes(:recipe_foods, :foods).all
    @recipes = RecipeFood.all
  end
end
