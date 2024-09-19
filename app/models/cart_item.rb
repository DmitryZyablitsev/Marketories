class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :cart, :product, presence: true
  validates :cart_id, uniqueness: { scope: :product_id }#, message: I18n::t('activerecord.errors.messages.error_product_in_the_cart') }
end
