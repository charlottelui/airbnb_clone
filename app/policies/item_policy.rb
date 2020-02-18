class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def show?
      true
    end

    def update?
      owner?
    end

    def destroy?
      owner?
    end

    def destroy_photo?
      owner?
    end

    private

    def owner?
      record.user == user
    end
end
