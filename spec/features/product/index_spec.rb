require 'rails_helper'

feature 'User can see list of products', "
  In order to acquainted with products
  As an user
  I'd like to be able to see list of products
" do
  given!(:products) do
    [
      create(:product),
      create(:product, :shirt)
    ]
  end

  scenario 'User can see list of products' do
    visit root_path

    products.each do |product|
      expect(page).to have_content product.title
      expect(page).to have_content product.price
    end
  end
end
