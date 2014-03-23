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
      find(:xpath, "//a[@href='/users/sign_in']").click
      expect(page).to have_content("Password")
    end

    scenario "must have a functional sign up link" do
      all(:xpath, "//a[@href='/users/sign_up']").first.click
      expect(page).to have_content("Email")
    end

  end

  context "for a logged in user" do
    before :each do
      visit "/"    
      all(:xpath, "//a[@href='/users/sign_up']").first.click

      fill_in 'user[user_name]', with: "rebel_meta_man"
      fill_in 'user[email]', with: "abed@aliance.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button "Sign up"

      @user = User.find_by_user_name("rebel_meta_man")
    end


    scenario "must have a functional profile link" do
      click_link "Profile"
      expect(page).to have_content(@user.first_name)
    end

    scenario "must have a functional create tutorial link" do
      visit "/"    
      all(:xpath, "//a[@href='/tutorials/new']").first.click
      expect(page).to have_content("Create")
    end

  end
end