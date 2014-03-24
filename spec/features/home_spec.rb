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
      user_create

      log_user_in
    end


    scenario "must have a functional profile link" do
      click_link "Profile"
      expect(page).to have_content(@user.user_name)
    end

    scenario "must have a functional create tutorial link" do
      visit "/"    
      all(:xpath, "//a[@href='/tutorials/new']").first.click
      expect(page).to have_content("Create")
    end

  end
end