require 'spec_helper'

# rspec spec --format documentation

feature 'Image Creation' do
  context "with a logged in user" do 
    before :each do
      user_create    
      tutorial_create    
      chapter_create    
      sub_chapter_create
      
      log_user_in

      visit "/sub_chapters/#{@sub_chapter.id}"
      click_link("image")
    end
  
    scenario "uploading an image persists an image in the database" do
      expect{
        attach_file("image[image_path]", File.expand_path('spec/fixtures/files/test_image.jpg'))
        click_button "Create Image"
        }.to change(Image, :count).by(1) 
    end

    scenario "uploading an image redirects to a page with the image on it" do
      attach_file("image[image_path]", File.expand_path('spec/fixtures/files/test_image.jpg'))
      click_button "Create Image"
      page.find('img')['alt'].should have_content 'Test image'
    end

    scenario "with no image will not save an image to the database" do
      expect{
        click_button "Create Image"
        }.to change(Image, :count).by(0) 
    end

    scenario "with no image redirects to image#new view with an error message" do
      click_button "Create Image"
      expect(page).should have_content 'You must upload an image'
      expect(page).should have_content 'Image path'
    end

    scenario "with a non-image file redirects to image#new view with an error message" do
      attach_file("image[image_path]", File.expand_path('db/seeds.rb'))
      click_button "Create Image"
      expect(page).should have_content 'This file type is not allowed '
      expect(page).should have_content 'Image path'
    end

  end
end