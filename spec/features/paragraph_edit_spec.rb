require 'spec_helper'

feature 'Paragraph Editting' do
  context "with a logged in user" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
      @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
      @sub_chapter = @chapter.sub_chapters.create(title: "subbie", chapter_id: @chapter.id)

      @sub_chapter = @chapter.sub_chapters.create(title: "subbie", chapter_id: @chapter.id)
      @paragraph = Paragraph.create(body: "garbage")
      @sub_chapter.contents.create(order_number: 1, attachable_type: "Paragraph", attachable_id: @paragraph.id)    
      visit "/"    
      click_link "log in"

      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: "password"
      click_button "Sign in"
      visit "/paragraphs/#{@paragraph.id}/edit"
    end

    scenario "must after updating body redirect to a page with that body present" do
        fill_in 'paragraph[body]', with: "Dajayj"
        click_button "Update Paragraph"
        expect(page).to have_content("Dajayj")
    end


  end

end