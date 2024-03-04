class RecipesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
