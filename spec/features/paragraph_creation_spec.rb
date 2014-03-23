require 'spec_helper'

# rspec spec --format documentation

feature 'Paragraph Creation' do
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
      click_link("text")
    end
  

    # CANT TEST IN THE DIV
    xscenario "hitting Create Paragraph creates a new paragraph in the database" do
      expect{
        fill_in 'paragraph[body]', with: "Dajayj"
        click_button "Create Paragraph"
      }.to change(Paragraph, :count).by(1) 
    end

    xscenario "hitting Create Paragraph directs to new page with paragraph shown" do
      fill_in 'paragraph[body]', with: "Dajayj"
      click_button "Create Paragraph"
      expect(page).to have_content("Dajayj")
    end

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