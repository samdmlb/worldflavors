class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    # @last_dish = UserRecipe.last.recipe.name
  end

end
