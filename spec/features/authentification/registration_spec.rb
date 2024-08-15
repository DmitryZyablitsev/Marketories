require 'rails_helper'

feature 'Unregistered user can register' do
  background do
    visit root_path
    click_on 'Register'
  end

  describe "User's email does not exist in the database" do
    scenario 'User has successfully registered' do
      fill_in 'Email', with: 'user@test.ru'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_on 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario 'User made mistakes during registration' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: '11111111'
      fill_in '', with: '22222222'

      expect(page).to have_content '2 error(s) detected:'
      expect(page).to have_content 'The email cannot be empty'
      expect(page).to have_content "passwords don't match"
    end
  end

  scenario "User's email exists in the database" do
    given!(:user) { create(:user) }

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in '', with: user.password

    expect(page).to have_content 'This user exists in the system'
  end
end
