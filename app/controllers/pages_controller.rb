class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    recipes_user = Recipe.joins(:user_recipes).where(user_recipes: { user: current_user })
    @badges_won = Badge.where(id: current_user.badges.pluck(:id))
    @badges_locked = Badge.where.not(id: current_user.badges.pluck(:id))

    if UserRecipe.where(user: current_user).last.nil?
      @m_last_dish = "You haven't completed a recipe yet"
    else
      @m_last_dish = UserRecipe.where(user: current_user).last.recipe.name
    end

    if UserRecipe.where(user: current_user).last.nil?
      @m_average_time = "You haven't completed a recipe yet"
    else
      @m_average_time = recipes_user.average(:prep_time).round
    end

    if UserRecipe.where(user: current_user).last.nil?
      @m_most_ingredient = "You haven't completed a recipe yet"
    else
      @m_most_ingredient = recipes_user.joins(:ingredients).
                           group('ingredients.name').count.
                           sort_by { |_key, value| value }.last&.first
    end

    if UserRecipe.where(user: current_user).last.nil?
      @m_favorite_country = "You haven't completed a recipe yet"
    else
      @m_favorite_country = Country.joins(recipes: :user_recipes).
                            where(user_recipes: { user: current_user }).
                            group('countries.name').count.sort_by { |_key, value| value }.
                            last&.first
    end

  end

  def cookbook
    @user_recipes = UserRecipe.where(user_id: current_user.id).order(created_at: :desc) || []
  end
end
