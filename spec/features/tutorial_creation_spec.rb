require 'spec_helper'

feature 'Tutorial Creation' do
  before :each do
    @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
    

    visit "/"    
    click_link "log in"

    fill_in 'user[email]', with: "tutorial_tester@aliance.com"
    fill_in 'user[password]', with: "password"
    click_button "Sign in"
  end  

  context "for a non-logged in user accessing the route" do
    scenario "must be given confirmation alert" do
      click_link "logout"
      visit "/tutorials/new"
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

  context "for a logged user" do
    before :each do
      visit "/tutorials/new"
      fill_in 'tutorial[title]', with: "abcdef"
      fill_in 'tutorial[description]', with: "ghijk"
      click_button "Create Tutorial"
    end
  
    scenario "the form must direct to must direct to page with created fields present" do
      expect(page).to have_content("abcdef")
      expect(page).to have_content("ghijk")
    end

    scenario "must direct to page with success alert message" do
      expect(page).to have_content("Your new tutorial has been created!")
    end
  end
end