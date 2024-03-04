class UserRecipesController < ApplicationController

  def create
    raise
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
