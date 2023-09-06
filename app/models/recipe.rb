class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  scope :public_recipes, -> { where(public: true) }

  before_save :toggle_public, if: :public_changed?

  def toggle_public
    self.public = !public
  end
end
