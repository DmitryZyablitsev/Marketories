require 'rails_helper'

feature 'The user can delete product from the cart', "
  As a user, I would like to be able to remove 
  unwanted items from my shopping cart
" do
  given(:product1) { create(:product) }
  given(:product2) { create(:product, :shirt) }
  given(:user_buyer) { create(:user) }
  given(:cart) { user_buyer.cart }
  given!(:cart_item1) { create(:cart_item, cart: cart, product: product1 ) }
  given!(:cart_item2) { create(:cart_item, cart: cart, product: product2 ) }

  describe 'Authenticated user ' do
    it 'successfully removes an item from the shopping cart' do
      sign_in(user_buyer)
      click_on 'Cart'
      
      within(".cart-item-#{product1.id}") do
        click_on "Delete"
      end

      expect(page).to have_content product2.title
      expect(page).not_to have_content product1.title
    end
  end

  describe 'Unauthenticated user' do
    it 'we invite the user to sign in or sign up' do
      visit product_path(product)
      click_on 'Add to Cart'
  
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(page).to have_button 'Log in'
    end
  end
end
