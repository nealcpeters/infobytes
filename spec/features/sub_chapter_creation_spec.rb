require 'spec_helper'

feature 'Sub chapter Creation' do
  before :each do
    @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
    @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
    @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
    visit "/"    
    find(:xpath, "//a[@href='/users/sign_in']").click

    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: "password"
    click_button "Sign in"
    visit "/chapters/#{@chapter.id}"
    find(:xpath, "//a[@href='/chapters/#{@chapter.id}/sub_chapters/new']").click
  end

  context "with a logged in user" do 

    scenario "must be called with Create Subchapter link on chapter show" do
      expect(page).to have_content("Title")
    end

    scenario "must create a sub chapter if title is given" do
      fill_in 'sub_chapter[title]', with: "polyglot"
      click_button "Create Subchapter"
      expect(page).to have_content("polyglot") 
    end

    scenario "must create a sub chapter in the database" do
      expect{
        fill_in 'sub_chapter[title]', with: "polyglot"
        click_button "Create Subchapter"
      }.to change(SubChapter, :count).by(1) 
    end

  end

  # Can't get a test to work on checking if submitted with an empty title space, claims an error method

  context "after created" do
    before :each do
      fill_in 'sub_chapter[title]', with: "polyglot"
      click_button "Create Subchapter"
    end

    scenario "must have an add text link" do
      expect(page).to have_content("text")
    end

    scenario "the add text link goes to text creation page" do
      click_link("text")
      expect(page).to have_content("Body")
    end

    scenario "must have an add code link" do
      expect(page).to have_content("code")
    end
    
    scenario "must have an add code link" do
      click_link("code")
      expect(page).to have_content("Code Language")
      expect(page).to have_content("Code Block")
    end

    scenario "must have an add image link" do
      expect(page).to have_content("image")
    end
    
    scenario "must have an add text link" do
      click_link("image")
      expect(page).to have_content("Image path")
    end
  end

end