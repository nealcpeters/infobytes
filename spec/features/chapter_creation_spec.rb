require 'spec_helper'

feature 'Chapter Creation' do
  context "with a logged in user" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      

      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: "tutorial_tester@aliance.com"
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      visit "/tutorials/new"
      fill_in 'tutorial[title]', with: "abcdef"
      fill_in 'tutorial[description]', with: "ghijk"
      click_button "Create Tutorial"
      click_link "Add Chapter"

    end

    scenario "clicking on the add chapter bring add chapter form up" do
      fill_in 'user[password]', with: "password"
      expect(page).to have_content("Title")      
    end
  
  end

end