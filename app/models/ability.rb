class Ability
  include CanCan::Ability
  include ActionView::Helpers

  def initialize(user)
    if user.blank?
      # not logged in
      cannot :manage, :all
      base_role
    elsif user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:member)
      can :manage, User, :id => user.id
      base_role
    end
  end

  protected

  def base_role
    can  :read, :all
  end
end
