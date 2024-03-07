class RecipesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = UserRecipe.new
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
    @steps = Step.where(recipe_id: @recipe.id)
  end
end
