class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  validates :user, uniqueness: { scope: :badge }
end
