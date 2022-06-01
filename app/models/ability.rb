# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin_role?
        can :manage, :all
    end

    if user.doctor_role?
      can [:index], Category
      can [:read, :edit, :update], Appointment
    end

    if user.user_role?
      can [:read], Category
      can [:new], Appointment
    end
  end
end
