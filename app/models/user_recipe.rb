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
    badge_lvl5
    badge_lvl10
    badge_lvl15
    badge_lvl20
    badge_lvl25
  end

  def badge_country3
    country_id = recipe.country_id

    # Nombre de user_recipe ayant la meme condition
    user_recipes_count = UserRecipe.where(user_id:).joins(recipe: :country).where(countries: { id: country_id }).count

    # Correspondance entre la condition et le badge
    country_hash = { france: "French cook",
                     italy: "Italian cook" }

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

  def badge_lvl5
    UserBadge.create(user_id:, badge: Badge.find_by(name: "Level 5")) if user.xp > 2000 && (user.xp - recipe.xp) < 2000
  end

  def badge_lvl10
    UserBadge.create(user_id:, badge: Badge.find_by(name: "Level 10")) if user.xp > 4500 && (user.xp - recipe.xp) < 4500
  end

  def badge_lvl15
    UserBadge.create(user_id:, badge: Badge.find_by(name: "Level 15")) if user.xp > 7000 && (user.xp - recipe.xp) < 7000
  end

  def badge_lvl20
    UserBadge.create(user_id:, badge: Badge.find_by(name: "Level 20")) if user.xp > 9500 && (user.xp - recipe.xp) < 9500
  end

  def badge_lvl25
    UserBadge.create(user_id:, badge: Badge.find_by(name: "Level 25")) if user.xp > 12000 && (user.xp - recipe.xp) < 12000
  end
end
