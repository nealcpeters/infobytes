require 'spec_helper'

feature 'Home Page' do
  before :each do 
      visit "/"    
  end

  context "for a non-logged in user" do
    scenario "must have the title" do
      expect(page).to have_content("infobytes")
    end

    scenario "must have a functional log in link" do
      click_link "log in"
      expect(page).to have_content("Password")
    end

    scenario "must have a functional sign up link" do
      click_link "sign up"
      expect(page).to have_content("First name")
    end

  end

  context "for a logged in user" do
    before :all do
      visit "/"    
      click_link "sign up"

      fill_in 'user[first_name]', with: "Abed"
      fill_in 'user[last_name]', with: "Solo"
      fill_in 'user[user_name]', with: "rebel_meta_man"
      fill_in 'user[email]', with: "abed@aliance.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button "Sign up"

      @user = User.find_by_user_name("rebel_meta_man")
    end


    scenario "must have a functional profile link" do
      click_link "profile"
      expect(page).to have_content(@user.first_name)
    end

  end
end