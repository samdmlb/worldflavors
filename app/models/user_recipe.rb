class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user, uniqueness: { scope: :recipe }

  after_create :check_and_create_user_badge

  private

  def check_and_create_user_badge
    badge_country3
    badge_difficulty3
  end

  def badge_country3
    country_id = recipe.country_id

    # Nombre de user_recipe ayant la meme condition
    user_recipes_count = UserRecipe.where(user_id:).joins(recipe: :country).where(countries: { id: country_id }).count

    # Correspondance entre le pays et le badge
    badge_name = case Country.find(country_id).name
                 when "france"
                   "Badge France"
                 when "italy"
                   "Badge Italy"
                 end

    # Créer un user_badge avec le badge correspondant si la condition est remplise
    UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user_recipes_count == 3
  end

  def badge_difficulty3
    difficulty = recipe.difficulty

    # Nombre de user_recipe ayant la meme condition
    user_recipes_count = UserRecipe.joins(:recipe).where(recipes: { difficulty: }).count

    # Correspondance entre la difficulté et le badge
    badge_name = case difficulty
                 when "easy"
                   "Badge Easy"
                 when "medium"
                   "Badge Medium"
                 when "hard"
                   "Badge Hard"
                 end

    # Créer un user_badge avec le badge correspondant si la condition est remplise
    UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user_recipes_count == 3
  end
end
