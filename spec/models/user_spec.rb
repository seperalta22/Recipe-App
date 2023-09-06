# class User < ApplicationRecord
#   has_many :inventories
#   has_many :recipes
#
#   enum role: { admin: 'admin' }
#
#   def admin?
#     role == 'admin'
#   end
# end

# Path: spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'admin?' do
    it 'returns true when the role is admin' do
      user = User.new(role: 'admin')
      expect(user.admin?).to eq(true)
    end
  end

  it 'has many inventories' do
    association = described_class.reflect_on_association(:inventories)
    expect(association.macro).to eq :has_many
  end

  it 'has many recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq :has_many
  end
end
