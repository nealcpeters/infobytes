require 'spec_helper'

feature 'Chapter Creation' do
  context "with a logged in user" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)

      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: "tutorial_tester@aliance.com"
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      visit "/tutorials/#{@tutorial.id}"
      click_link "Add Chapter"

    end

    scenario "clicking on the add chapter bring add chapter form up" do
      fill_in 'chapter[title]', with: "polyglot"
      click_button "Add Chapter"
      expect(page).to have_content("polyglot")      
    end

    scenario "clicking on the add chapter saves a record to the database" do
      fill_in 'chapter[title]', with: "polyglot"
      expect {
        click_button("Add Chapter")
        }.to change(Chapter, :count).by(1)      
    end


    scenario "not including a title will fail" do
      click_button "Add Chapter"
      expect(page).to have_content("Title")      
    end
  
  end
  
end