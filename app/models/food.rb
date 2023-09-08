class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods

  validates :name, presence: true, length: { maximum: 20, too_long: '%<count>s characters is the maximum allowed' }
  validates :measurement_unit, presence: true, length: { maximum: 20, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
