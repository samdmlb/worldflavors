class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @badges_won = Badge.where(id: current_user.badges.pluck(:id))
    @badges_locked = Badge.where.not(id: current_user.badges.pluck(:id))

    if UserRecipe.where(user: current_user).last.nil?
      @m_last_dish = "You haven't completed a recipe yet"
    else
      @m_last_dish = UserRecipe.where(user: current_user).last.recipe.name
    end
  end

  def cookbook
    @user_recipes = UserRecipe.where(user_id: current_user.id) || []
  end
end
