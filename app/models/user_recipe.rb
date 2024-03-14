class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user, uniqueness: { scope: :recipe }

  after_create :check_and_create_user_badge

  private

  def check_and_create_user_badge
    badge_country3
    badge_difficulty3
    badge_keyword3
  end

  def badge_country3
    country_id = recipe.country_id

    # Nombre de user_recipe ayant la meme condition
    user_recipes_count = UserRecipe.where(user_id:).joins(recipe: :country).where(countries: { id: country_id }).count

    # Correspondance entre la condition et le badge
    country_hash = { france: "French cook",
                     italy: "Ttalian cook" }

    badge_name = country_hash[Country.find(country_id).name.to_sym]

    # Créer un user_badge avec le badge correspondant si la condition est remplise
    UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user_recipes_count == 3
  end

  def badge_difficulty3
    difficulty = recipe.difficulty

    # Nombre de user_recipe ayant la meme condition
    user_recipes_count = UserRecipe.where(user_id:).joins(:recipe).where(recipes: { difficulty: }).count

    # Correspondance entre la condition et le badge
    difficulty_hash = { easy: "Easy",
                        medium: "Medium",
                        hard: "Hard" }

    badge_name = difficulty_hash[difficulty.to_sym]

    # Créer un user_badge avec le badge correspondant si la condition est remplise
    UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user_recipes_count == 3
  end

  def badge_keyword3
    keywords = recipe.keyword_list

    keywords.each do |keyword|
      # Nombre de user_recipe ayant la meme condition
      user_recipes_count = UserRecipe.where(user_id:).joins(recipe: :keywords).where(keywords: { name: keyword }).count

      # Correspondance entre la condition et le badge
      keywords_hash = { pork: "Badge Pork",
                        beef: "Badge Beef",
                        chicken: "Badge Chicken",
                        vegan: "Badge Vegan",
                        vegetarian: "Vegetarian cook",
                        dessert: "Badge Dessert",
                        duck: "Badge Duck" }

      badge_name = keywords_hash[keyword.to_sym]

      # Créer un user_badge avec le badge correspondant si la condition est remplise
      UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user_recipes_count == 3
    end
  end
end
