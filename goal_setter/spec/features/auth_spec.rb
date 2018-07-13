require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("Create User")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'Email', with: "email@email.com"
      fill_in 'Password', with: "password"
      click_button 'Create User'
      
      expect(page).to have_content('email@email.com')
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    User.create(email: 'email@email.com', password: 'password')
    visit new_session_url
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    click_button "This is the Log In button"
    expect(page).to have_content("email@email.com")
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content('Hello new user!')
  end

  # scenario 'doesn\'t show username on the homepage after logout' do
  #   user = User.create(email: 'email@email.com', password: 'password')
  #   visit new_session_url
  #   fill_in 'Email', with: "email@email.com"
  #   fill_in 'Password', with: "password"
  #   click_button 'This is the Log In button'
  # 
  #   save_and_open_page
  #   click_button 'Log out'
  #   expect(page).to_not have_content('email@email.com')
  # end

end