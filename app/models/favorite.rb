class Favorite < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  belongs_to :album
end
