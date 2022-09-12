class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food, through: :recipe_food
end
