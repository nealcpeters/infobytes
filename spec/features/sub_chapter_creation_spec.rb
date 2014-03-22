require 'spec_helper'

feature 'Sub chapter Creation' do
  context "with a logged in user" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
      @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      visit "/chapters/#{@chapter.id}"
      find(:xpath, "//a[@href='/chapters/#{@chapter.id}/sub_chapters/new']").click

    end
  
    scenario "must be called with create sub chapter link on chapter show" do
      expect(page).to have_content("Title")
    end

    scenario "must create a sub chapter if title is given" do
      fill_in 'sub_chapter[title]', with: "polyglot"
      click_button "Create Sub chapter"
      expect(page).to have_content("polyglot") 
    end

    scenario "must create a sub chapter in the database" do
      expect{
        fill_in 'sub_chapter[title]', with: "polyglot"
        click_button "Create Sub chapter"
      }.to change(SubChapter, :count).by(1) 
    end


    # Can't get a test to work on checking if submitted with an empty title space, claims an error method
    
  end

end