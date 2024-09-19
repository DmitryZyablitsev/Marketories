require 'rails_helper'

feature 'The user can add the product to the cart', "
  In order to order several products at once, 
  as an online store user, 
  I would like to be able to add products to the cart
" do
  given(:user_buyer) { create(:user) }
  given!(:product) { create(:product) }

  describe 'Authenticated user adds an item to the cart' do
    background do
      sign_in(user_buyer)
      visit product_path(product)
      click_on 'Add to Cart'
    end

    it 'sees a success notification by staying on the product page' do
      # save_and_open_page
      expect(page).to have_content 'Product has been added to the cart'
      expect(page).to have_content product.title
    end

    it 'goes to the shopping cart and sees the added product' do
      click_on 'Cart'

      expect(page).to have_content product.title
    end
  end

  it 'Unauthenticated user we invite the user to sign in or sign up' do
    visit product_path(product)
    click_on 'Add to Cart'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
    expect(page).to have_button 'Log in'
  end
end
