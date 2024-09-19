require 'rails_helper'

feature 'Пользователь может изменить количество товара', "
  Как зарегестрированный пользотаель я бы хотел иметь возможность 
  добовлять или убовлять количество определённого товара в корзине
" do
  given(:user_buyer) { create(:user) }
  given(:cart) { user_buyer.cart }
  given!(:cart_item1) { create(:cart_item, cart: cart, product: product1 ) }
  given(:product1) { create(:product) }


  describe 'Authenticated user' do
    background do
      sign_in(user_buyer)
      click_on 'Cart'
    end

    it 'добавляет количество товаров' do
      within(".cart-item-#{product1.id}") do
        click_on '+'

        expect(page).to have_content '2'
      end
    end

    it 'убавить количество товаров' do
      within(".cart-item-#{product1.id}") do
        click_on '+'
        click_on '-'

        expect(page).to have_content '1'
      end
    end

    it 'убавить количество товаров меньше одного нельзя' do
      within(".cart-item-#{product1.id}") do

      expect(page).to have_no_button("-")
      end
    end
  end

  it 'Unauthenticated user' do
    visit product_path(product)
    click_on 'Add to Cart'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
    expect(page).to have_button 'Log in'
  end
end
