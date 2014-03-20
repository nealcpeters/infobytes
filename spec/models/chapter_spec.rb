require 'spec_helper'

describe Chapter do
context "when creating a chapter" do
	it "it creates a valid chapter" do
		expect{
	      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: "what is star wars?")
	        }.to change(Chapter, :count).by(1)
	    end

	 it "it will not create a chapter without a title" do
	    expect{
	      	user_tutorial = User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports").chapters.create(title: nil)
	    	}.to change(Chapter, :count).by(0)
	  	end
 	
	 end
end
