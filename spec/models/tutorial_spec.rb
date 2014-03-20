require 'spec_helper'

describe Tutorial do
  context "when creating a tutorial" do
    it "it creates a valid tutorial" do
      expect{
      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star", description: "How to find small exhaust ports")
            	}.to change(Tutorial, :count).by(1)
    end

    it "it will not create a tutorial without a title" do
    	expect{
      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(description: "How to find small exhaust ports")
    	}.to change(Tutorial, :count).by(0)
  	end

  	it "it will not create a tutorial without a description" do
  		expect{
  			User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password").tutorials.create(title: "Destroy the Death Star")
  		}.to change(Tutorial, :count).by(0)
  	end  	
  end
end
