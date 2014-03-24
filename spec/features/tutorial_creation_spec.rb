require 'spec_helper'

feature 'Tutorial Creation' do
  before :each do
    user_create    

    log_user_in    
  end  

  context "for a non-logged in user accessing the route" do
    scenario "must be given confirmation alert" do
      find(:xpath, "//a[@href='/users/sign_out']").click
      visit "/tutorials/new"
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

  context "for a logged user" do
    scenario "the form must direct to must direct to page with created fields present" do
      visit "/tutorials/new"
      fill_in 'tutorial[description]', with: "ghijk"
      click_button "Create Tutorial"
      expect(page).to have_content("can't be blank")
    end
    
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

    # xscenario "clicking on the add chapter bring add chapter form up" do
    #   click_link "Add Chapter"
    #   expect(page).to have_content("Title")      
    # end
  end
end