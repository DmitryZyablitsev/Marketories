require 'rails_helper'

feature 'Unregistered user can register' do
  given(:user) { create(:user) }

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

      expect(page).to have_content 'A message with a confirmation link has been sent to your email address.'
    end

    scenario 'User made mistakes during registration' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '123456788'
      click_on 'Sign up'

      expect(page).to have_content '2 errors prohibited this user from being saved:'
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  scenario "The user's email exists in the database" do
    user
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_on 'Sign up'

    expect(page).to have_content 'Email has already been taken'
  end
end
