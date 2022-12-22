# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, [User, Food, Recipe, RecipeFood]
    else
      can :manage, [Food, Recipe, RecipeFood], author_id: user.id
    end
  end
end
