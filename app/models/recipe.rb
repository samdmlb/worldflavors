class Recipe < ApplicationRecord
  belongs_to :country
  has_many :user_recipes
  has_many :steps
  has_many :recipe_ingredients
end
