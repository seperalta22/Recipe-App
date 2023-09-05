class User < ApplicationRecord
  has_many :inventories
  has_many :recipes

  enum role: { admin: 'admin' }

  def admin?
    role == 'admin'
  end
end
