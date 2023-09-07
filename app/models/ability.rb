class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true
    return unless user.present?

    can :read, :all
    can :manage, Food

    can :manage, Recipe, user_id: user.id
    can :manage, RecipeFood, recipe: { user_id: user.id }
    can :manage, Inventory, user_id: user.id
    can :manage, InventoryFood, inventory: { user_id: user.id }

    # can :manage, :all, user_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
