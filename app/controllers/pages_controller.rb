class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    if UserRecipe.last.nil?
      @m_last_dish = "You haven't completed a recipe yet"
    else
      @m_last_dish = UserRecipe.last.recipe.name
    end
  end

  def cookbook
    @user_recipes = UserRecipe.where(user_id: current_user.id) || []
  end
end
