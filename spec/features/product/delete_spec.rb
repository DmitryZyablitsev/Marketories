require 'rails_helper'

feature 'User can delete the product', "
  To stop selling the product
  As the owner of the product
  I would like to be able to delete the product
" do
  given(:product) { create(:product) }

  scenario 'User can delete product' do
    visit product_path(product)

    click_on 'Delete'

    expect(page).to have_content 'Your product has been deleted.'
    %i[title description specification price].each do |attr|
      expect(page).to have_no_content product.send(attr)
    end
  end
end
