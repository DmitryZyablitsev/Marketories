shared_examples_for 'Create Product' do
  background do
    sign_in(user)
    visit root_path
    click_on 'Add a product'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Shirt'
    fill_in 'Description', with: 'Excellent'
    fill_in 'Specification', with: 'Сotton'
    fill_in 'Price', with: 800

    click_on 'Save'

    expect(page).to have_content 'Your product successfully created.'

    %w[Shirt Excellent Сotton 800].each do |data|
      expect(page).to have_content data
    end
  end

  scenario 'not successful' do
    fill_in 'Title', with: '     '
    click_on 'Save'

    expect(page).to have_content '4 error(s) detected:'

    %w[Title Description Specification Price].each do |attr|
      expect(page).to have_content "#{attr} can't be blank"
    end
  end
end
