require 'rails_helper'

feature 'User can delete the product', "
  To stop selling the product
  As the owner of the product
  I would like to be able to delete the product
" do
  given(:user_author) { create(:user) }
  given(:user_other) { create(:user) }
  given(:user_admin) { create(:user, :admin) }
  given(:product) { create(:product, user: user_author) }

  describe 'Authenticated user' do
    describe 'is the author' do
      it_behaves_like 'Delete Product' do
        given(:user) { user_author }
      end
    end

    describe 'is the admin' do
      it_behaves_like 'Delete Product' do
        given(:user) { user_admin }
      end
    end

    describe 'is not the author' do
      it 'the delete link is missing' do
        sign_in(user_other)
        visit product_path(product)

        expect(page).to have_no_link 'Delete'
      end
    end
  end

  describe 'Unauthenticated user' do
    it 'the delete link is missing' do
      visit product_path(product)

      expect(page).to have_no_link 'Delete'
    end
  end
end
