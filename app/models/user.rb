class User < ApplicationRecord
  enum role: { buyer: 0, seller: 1, admin: 2 }, _suffix: :role
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :products, dependent: :destroy

  validates :email, presence: true

  def guest?
    false
  end

  def author?(obj)
    obj.user == self
  end
end
