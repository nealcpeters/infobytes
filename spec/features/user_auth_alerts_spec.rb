require 'spec_helper'

feature 'User Auth Alerts' do
  context "for a new user upon sign up" do
    scenario "must give confirmation alert" do
      visit "/"    
      click_link "sign up"

      fill_in 'user[first_name]', with: "Han"
      fill_in 'user[last_name]', with: "Solo"
      fill_in 'user[user_name]', with: "rebel_scum_test"
      fill_in 'user[email]', with: "han@aliance_rocks.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button "Sign up"

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  context "for a returning user upon sign in" do
    scenario "must give confirmation alert" do
      user = User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum1", email: "1han@aliance.com", password: "password", password_confirmation: "password")

      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: "1han@aliance.com"
      fill_in 'user[password]', with: "password"
      click_button "Sign in"

      expect(page).to have_content("Signed in successfully.")
    end
  end

  context "for a logged in user" do
    scenario "must give confirmation alert" do
      user = User.create(first_name: "Leia", last_name: "Solo", user_name: "rebel_princess", email: "leia@aliance.com", password: "password", password_confirmation: "password")

      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: "leia@aliance.com"
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      click_link "logout"

      expect(page).to have_content("Signed out successfully.")
    end
  end
end