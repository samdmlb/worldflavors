module RecipesHelper

  def bookmark_exists_for_recipe?(recipe)
    current_user && recipe.bookmarks.exists?(user_id: current_user.id)
  end

end
