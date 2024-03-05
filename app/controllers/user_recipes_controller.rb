class UserRecipesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:id])
    @user_recipe = current_user.user_recipes.build(recipe: @recipe)
    @user_recipe.save
    redirect_to recipe_path(@recipe)
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
  end

end
