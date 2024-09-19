require 'rails_helper'

feature 'The user can open the shopping cart', "
  In order to place an order, 
  as a user I would like to be able to 
  view the items in the cart
" do
  given(:product) { create(:product) }
  given(:product2) { create(:product, :shirt) }
  given(:user_buyer) { create(:user) }
  given(:cart) { user_buyer.cart }
  given!(:cart_item1) { create(:cart_item, cart: cart, product: product ) }
  given!(:cart_item2) { create(:cart_item, cart: cart, product: product2 ) }

  describe 'Authenticated user' do
    it 'goes to the shopping cart page' do
      sign_in(user_buyer)
      click_on 'Cart'

      expect(page).to have_content 'Cart'
      user_buyer.cart.cart_items.each do |cart_item|
        expect(page).to have_content(cart_item.product.title)
      end
    end
  end

  describe 'Unauthenticated user' do
    it 'goes to the sign in page' do
      visit root_path
      click_on 'Cart'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
      expect(page).to have_button 'Log in'
    end
  end  
end
