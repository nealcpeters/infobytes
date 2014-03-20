require 'spec_helper'

describe SubChapter do
context "when creating a sub-chapter" do
	it "it creates a valid sub-chapter" do
		expect{
	      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: "what is star wars?").sub_chapters.create(title: "Star Wars history")
	        }.to change(SubChapter, :count).by(1)
	    end

	 xit "it will not create a sub-chapter without a title" do
	    expect{
	      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: nil).sub_chapters.create(title: nil)
	    	}.to change(Chapter, :count).by(0)
	  	end
 	
	 end
end
