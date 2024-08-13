require 'rails_helper'

feature 'User can create a product card', "
  To sell your product
  As a user
  I would like to be able to create a product card
" do
  background do
    visit root_path
    click_on 'Add a product'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Shirt'
    fill_in 'Description', with: 'Excellent'
    fill_in 'Specification', with: 'Сotton'
    fill_in 'Price', with: 800

    click_on 'Create'

    expect(page).to have_content 'Your product successfully created.'

    %w[Shirt Excellent Сotton 800].each do |data|
      expect(page).to have_content data
    end
  end

  scenario 'not successful' do
    fill_in 'Title', with: '     '
    click_on 'Create'

    expect(page).to have_content '4 error(s) detected:'

    %w[Title Description Specification Price].each do |attr|
      expect(page).to have_content "#{attr} can't be blank"
    end
  end
end
