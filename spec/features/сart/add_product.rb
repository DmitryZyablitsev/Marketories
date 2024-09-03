require 'rails_helper'

feature 'The user can add the product to the cart', "
  in order to order several products at once, 
  as an online store user, 
  I would like to be able to add products to the cart
" do
  given(:user_buyer) { create(:user) }
  given(:product) { create(:product) }


  it 'Authenticated user the product has been added to the cart' do
    sign_in(user)
    visit product_path(product)
    click_on 'Add to Cart'

    expect(page).to have_content 'Product has been added to the cart'
  end

  it 'Unauthenticated user we invite the user to sign in or sign up' do
    visit product_path(product)
    click_on 'Add to Cart'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end
