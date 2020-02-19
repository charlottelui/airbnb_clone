class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # would be true. now it is only false if the item belongs to the current user
    !(user == record.item.user)
  end

  def destroy?
    true
  end
end
