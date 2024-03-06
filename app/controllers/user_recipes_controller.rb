class UserRecipesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new
    @user_recipe.user = current_user
    @user_recipe.recipe = @recipe
    if @user_recipe.save
      redirect_to user_recipe_path(@user_recipe)
    else
      render "", status: :unprocessable_entity
    end
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
  end

end
