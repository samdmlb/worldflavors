class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes
  has_many :user_badges
  has_many :badges, through: :user_badges

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
end
