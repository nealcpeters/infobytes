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
    scenario "must have the title" do
      expect(page).to have_content("infobytes")
    end

    scenario "must have a functional log in link" do
      find("i.fa-plus-square").click
      expect(page).to have_content("Create")
    end

    scenario "must have a functional sign up link" do
      click_link "sign up"
      expect(page).to have_content("First name")
    end

  end
end