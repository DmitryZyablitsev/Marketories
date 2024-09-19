shared_examples_for 'Edit Product' do
  background do
    sign_in(user)
    visit product_path(product)
    click_on 'Edit'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Shirt-Edit'
    fill_in 'Description', with: 'Excellent-Edit'
    fill_in 'Specification', with: 'Сotton-Edit'
    fill_in 'Price', with: 973

    click_on 'Save'

    expect(page).to have_content 'Your product successfully edited.'

    %w[Shirt-Edit Excellent-Edit Сotton-Edit 973].each do |data|
      expect(page).to have_content data
    end
  end

  scenario 'not successfully' do
    fill_in 'Description', with: '  '
    fill_in 'Specification', with: ''
    fill_in 'Price', with: '    '

    click_on 'Save'

    expect(page).to have_content '3 error(s) detected:'

    %w[Description Specification Price].each do |attr|
      expect(page).to have_content "#{attr} can't be blank"
    end
  end
end
