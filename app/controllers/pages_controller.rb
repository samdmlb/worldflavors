class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
  end

  def cookbook
    @user_recipes = UserRecipe.where(user_id: current_user.id) || []
  end
end
