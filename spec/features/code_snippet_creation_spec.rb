require 'spec_helper'

# rspec spec --format documentation

feature 'Code Snippet Creation' do
  context "with a logged in user" do 
    before :each do
      user_create    
      tutorial_create    
      chapter_create    
      sub_chapter_create
      
      log_user_in
      
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