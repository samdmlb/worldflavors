class Recipe < ApplicationRecord
  belongs_to :country
  has_many :user_recipes
  has_many :steps
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_one_attached :photo

  acts_as_taggable_on :keywords

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: :name,
                  associated_against: {
                    ingredients: :name,
                    country: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
