class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true
    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Inventory, user_id: user.id
    can :manage, Inventory_food do |inventory_food|
      inventory = Inventory.find_by(user_id: user.id)
      inventory_food.inventory_id = inventory.id
    end
    can :create, Food
    return unless user.admin?

    can :manage, :all
  end
end
