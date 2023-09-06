class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20, too_long: '%<count>s characters is the maximum allowed' }
end
