class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @user = current_user
    @recipes = current_user.recipes.includes(:user).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_foods = @recipe.recipe_foods
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  def public
    @public_recipes = Recipe.includes([:user], [:recipe_foods]).where(public: true).order(created_at: :desc)
    @public_recipes.each do |recipe|
      recipe.recipe_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = params[:user_id]

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(user_id: @recipe.user.id), notice: 'Recipe was successfully deleted.'
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
