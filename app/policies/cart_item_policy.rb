class CartItemPolicy < ApplicationPolicy

  def create?
    !user.guest?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
