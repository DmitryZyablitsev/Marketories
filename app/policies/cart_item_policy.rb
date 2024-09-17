class CartItemPolicy < ApplicationPolicy

  def create?
    user.cart == @record.cart || user.admin_role?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
