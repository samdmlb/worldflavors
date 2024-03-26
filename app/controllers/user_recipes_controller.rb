class UserRecipesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @user_recipe = UserRecipe.new(ur_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = @recipe
    if @user_recipe.save
      current_user.xp += @recipe.xp
      current_user.save
      redirect_to user_recipe_path(@user_recipe)
    else
      render "", status: :unprocessable_entity
    end
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
    @user_badges = UserBadge.where(user_id: current_user.id, created_at: @user_recipe.created_at..Time.now)
  end

  private

  def ur_params
    params.require(:user_recipe).permit(:photo)
  end
end
