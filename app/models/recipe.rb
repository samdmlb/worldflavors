class Recipe < ApplicationRecord
  belongs_to :country
  has_many :user_recipes, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
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

  def min_to_h
    return "#{prep_time / 60}h#{prep_time % 60 if prep_time % 60 != 0}#{'min' if prep_time % 60 != 0}" if prep_time > 60

    return "#{prep_time} min"
  end
end
