require 'spec_helper'

# rspec spec --format documentation

feature 'Paragraph Creation' do
  context "with a logged in user" do 
    before :each do
      user_create    
      tutorial_create    
      chapter_create    
      sub_chapter_create

      log_user_in

      visit "/sub_chapters/#{@sub_chapter.id}"
      click_link("text")
    end
  

    # CANT TEST IN THE DIV
    # xscenario "hitting Create Paragraph creates a new paragraph in the database" do
    #   expect{
    #     fill_in 'paragraph[body]', with: "Dajayj"
    #     click_button "Create Paragraph"
    #   }.to change(Paragraph, :count).by(1) 
    # end

    # xscenario "hitting Create Paragraph directs to new page with paragraph shown" do
    #   fill_in 'paragraph[body]', with: "Dajayj"
    #   click_button "Create Paragraph"
    #   expect(page).to have_content("Dajayj")
    # end

    scenario "submitting Create Paragraph with no body does not create a new paragraph" do
      expect{
        click_button "Create Paragraph"
      }.to change(Paragraph, :count).by(0) 
    end

    scenario "submitting Create Paragraph with no body gives error alert" do
      click_button "Create Paragraph"
      expect(page).to have_content("can't be blank")
    end

  end
end