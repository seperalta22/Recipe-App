class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inventories
  has_many :recipes

  enum role: { admin: 'admin' }

  def admin?
    role == 'admin'
  end
end
