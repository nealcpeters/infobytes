require 'spec_helper'

describe SubChapter do
context "when creating a sub-chapter" do
	it "it creates a valid sub-chapter" do
		expect{
    	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: "what is star wars?").sub_chapters.create(title: "Star Wars history")
      }.to change(SubChapter, :count).by(1)
    end

	it "it will not create a sub-chapter without a title" do
    expect{
    	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: "what is star wars?").sub_chapters.create(title: nil)
      }.to change(SubChapter, :count).by(0)
  	end
	end

	 context "#update_data changes and saves the sub_chapter instance" do
    it "it creates a valid tutorial" do
      user_create
      tutorial_create
      chapter_create
      sub_chapter_create
      @sub_chapter.update_data(50, 9_001)
      expect(@sub_chapter.chapter_id == 50).to be true
      expect(@sub_chapter.number == 9_001).to be true
    end
  end
end
