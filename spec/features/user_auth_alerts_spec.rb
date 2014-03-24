require 'spec_helper'

feature 'User Auth Alerts' do
  context "for a new user upon sign up" do
    scenario "must give confirmation alert" do
      visit "/"    
      all(:xpath, "//a[@href='/users/sign_up']").first.click
          
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
      user_create

      log_user_in

      expect(page).to have_content("Signed in successfully.")
    end
  end

  context "for a logged in user" do
    scenario "must give confirmation alert" do
      user_create

      log_user_in

      find(:xpath, "//a[@href='/users/sign_out']").click

      expect(page).to have_content("Signed out successfully.")
    end
  end
end