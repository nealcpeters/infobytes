require 'spec_helper'

# rspec spec --format documentation

feature 'Code Snippet Creation' do
  context "with a logged in user" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
      @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
      @sub_chapter = @chapter.sub_chapters.create(title: "subbie", chapter_id: @chapter.id)
      visit "/"    
      find(:xpath, "//a[@href='/users/sign_in']").click

      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      visit "/sub_chapters/#{@sub_chapter.id}"
      click_link("code")
    end
  
    scenario "hitting submit creates a new code snippet in the database" do
      expect{
        click_button "Submit"
      }.to change(CodeSnippet, :count).by(1) 
    end

    scenario "selecting a language and submitting saves that language" do
      select("JavaScript", :from => "code_snippet[language]")
      click_button "Submit"
      expect(CodeSnippet.last.language == "javascript").to be true
    end

  end

end