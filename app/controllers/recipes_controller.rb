class RecipesController < ApplicationController
  def index
    @countries = Country.all
    @searched_recipes = Recipe.all

    @searched_recipes = Recipe.tagged_with(params[:query]) unless Recipe.tagged_with(params[:query]).empty?

    case params[:preptime]
    when "1" then @searched_recipes = @searched_recipes.where(prep_time: (0..29))
    when "2" then @searched_recipes = @searched_recipes.where(prep_time: (30..60))
    when "3" then @searched_recipes = @searched_recipes.where(prep_time: (61..))
    end

    case params[:difficulty]
    when "1" then @searched_recipes = @searched_recipes.where(difficulty: "easy")
    when "2" then @searched_recipes = @searched_recipes.where(difficulty: "medium")
    when "3" then @searched_recipes = @searched_recipes.where(difficulty: "hard")
    end

    if params[:query].present? && Recipe.tagged_with(params[:query]).empty?
      @searched_recipes = @searched_recipes.global_search(params[:query])
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = UserRecipe.new
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
    @steps = Step.where(recipe_id: @recipe.id)
  end
end
