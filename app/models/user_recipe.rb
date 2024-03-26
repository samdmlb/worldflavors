class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_one_attached :photo

  validates :user, uniqueness: { scope: :recipe }

  after_create :check_and_create_user_badge

  private

  def check_and_create_user_badge
    badge_country3
    badge_difficulty3
    badge_keyword3
    badges_lvl
    badges_preptime
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

  def badges_lvl
    badge_requirements = {
      "Level 5" => 2000,
      "Level 10" => 4500,
      "Level 15" => 7000,
      "Level 20" => 9500,
      "Level 25" => 12000
    }

    user = User.find_by(id: user_id)

    badge_requirements.each do |badge_name, xp_requirement|
      UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if user.xp < xp_requirement && (user.xp + recipe.xp) > xp_requirement
    end
  end

  def badges_preptime
    badge_requirements = {
      "Badge 1h" => 60,
      "Badge 5h" => 300,
      "Badge 10h" => 600,
      "Badge 15h" => 900,
      "Badge 20h" => 1200,
      "Badge 25h" => 1500
    }

    total_preptime = UserRecipe.where(user_id:).sum { |ur| ur.recipe.prep_time }

    badge_requirements.each do |badge_name, required_time|
      UserBadge.create(user_id:, badge: Badge.find_by(name: badge_name)) if total_preptime >= required_time && (total_preptime - recipe.prep_time) < required_time
    end
  end
end
