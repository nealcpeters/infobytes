require 'spec_helper'

feature 'Tutorial Reader' do
  context "Upon first loading" do 
    before :each do
      @user = User.create(first_name: "Han", last_name: "Solo", user_name: "tutorial_tester", email: "tutorial_tester@aliance.com", password: "password", password_confirmation: "password")
      @tutorial = @user.tutorials.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", rating: 3, subtopic_id: 2)
      @chapter = @tutorial.chapters.create(title: "blah", number: 1, tutorial_id: @tutorial.id)
      @sub_chapter = @chapter.sub_chapters.create(title: "subbie", chapter_id: @chapter.id)
      visit "/tutorials/#{@tutorial.id}"
    end

    scenario "must have tutorial and chapter names" do
      expect(page).to have_content(@tutorial.title)
      expect(page).to have_content(@chapter.title)
    end

    # xscenario "must have linking icon next to chapter names that takes shows sub chapters" do
    #   find(:xpath, "//a[contains(@href, \"chapters/#{@chapter.id.to_s}\")]").click
    #   expect(page).to have_content(@sub_chapter.title)
    #   expect(page).to have_content(@tutorial.title)

    # end


  end

end