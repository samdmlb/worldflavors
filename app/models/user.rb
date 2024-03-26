class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_recipes, through: :bookmarks, source: :recipe, dependent: :destroy

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true

  def lvl
    return (xp / 500) + 1
  end

  def xp_modulo
    return xp % 500
  end
end
