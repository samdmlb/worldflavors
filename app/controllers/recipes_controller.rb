class RecipesController < ApplicationController
  def index
    @countries = Country.all
    @searched_recipes = Recipe.all

    case params[:preptime]
    when "1"
      @searched_recipes = @searched_recipes.where(prep_time: (0..30))
    when "2"
      @searched_recipes = @searched_recipes.where(prep_time: (30..60))
    when "3"
      @searched_recipes = @searched_recipes.where(prep_time: (60..))
    end

    case params[:difficulty]
    when "1"
      @searched_recipes = @searched_recipes.where(difficulty: "easy")
    when "2"
      @searched_recipes = @searched_recipes.where(difficulty: "medium")
    when "3"
      @searched_recipes = @searched_recipes.where(difficulty: "hard")
    end

    @searched_recipes = @searched_recipes.global_search(params[:query]) if params[:query].present?
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = UserRecipe.new
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
    @steps = Step.where(recipe_id: @recipe.id)
  end
end
