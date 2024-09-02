require 'rails_helper'

feature 'User can create a product card', "
  To sell your product
  As a user
  I would like to be able to create a product card
" do
  given(:user_buyer) { create(:user) }
  given(:user_seller) { create(:user, :seller) }
  given(:user_admin) { create(:user, :admin) }

  describe 'Authenticated user' do
    describe 'is the buyer' do
      it 'Add a product link is missing' do
        sign_in(user_buyer)
        visit root_path

        expect(page).to have_no_link 'Add a product'
      end
    end

    describe 'is the seller' do
      it_behaves_like 'Create Product' do
        given(:user) { user_seller }
      end
    end

    describe 'is the admin' do
      it_behaves_like 'Create Product' do
        given(:user) { user_admin }
      end
    end
  end

  describe 'Unauthenticated user' do
    it 'Add a product link is missing' do
      visit root_path

      expect(page).to have_no_link 'Add a product'
    end
  end
end
