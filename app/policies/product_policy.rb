class ProductPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.seller_role? || user.admin_role?
  end

  def update?
    user.author?(record) || user.admin_role?
  end

  def destroy?
    user.author?(record) || user.admin_role?
  end
end
