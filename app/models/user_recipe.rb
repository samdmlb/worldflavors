class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user, uniqueness: { scope: :recipe }
end
