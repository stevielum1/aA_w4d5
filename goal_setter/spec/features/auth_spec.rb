require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("Sign Up!")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'Email', with: "email@email.com"
      fill_in 'Password', with: "password"
      click_button 'Sign up'
      
      expect(page).to have_content('email@email.com')
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_sessions_url
    fill_in 'Email', with: "email@email.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    
    expect(page).to have_content('email@email.com')
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_sessions_url
    expect(session[:session_token]).to be_nil
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_sessions_url
    fill_in 'Email', with: "email@email.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    
    click_button 'Log out'
    expect(page).to_not have_content('email@email.com')
  end

end