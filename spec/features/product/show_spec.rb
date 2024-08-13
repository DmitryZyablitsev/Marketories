require 'rails_helper'

feature 'User can see product page', "
  In order to acquainted with product
  As an  user
  I'd like to be able to see product page
" do
  given(:product) { create(:product) }

  scenario 'User can see product page' do
    visit product_path(product)

    %i[title description specification price].each do |attr|
      expect(page).to have_content product.send(attr)
    end
  end
end
