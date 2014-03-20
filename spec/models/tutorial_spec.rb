require 'spec_helper'

describe Tutorial do
  # context "when creating a tutorial" do
  #   it "it creates a valid tutorial" do
  #     expect{
  #     	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
  #     	Tutorial.create(title: "Destroy the Death Star", description: "How to find small exhaust ports", rating: 1, user: 1, subtopic: "Programming")
  #   	}.to change(Tutorial, :count).by(1)
  #   end

  #   it "it will not create a tutorial without a title" do
  #   	expect{
  #     	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
  #     	Tutorial.create(description: "How to find small exhaust ports", rating: 1, user: 1, subtopic: "Programming")
  #   	}.to change(User, :count).by(0)
  # 	end

  # 	it "it will not create a tutorial without a description" do
  # 		expect{
  # 			User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
  #     	Tutorial.create(title: "Destroy the Death Star", rating: 1, user: 1, subtopic: "Programming")
  # 		}.to change(User, :count).by(0)
  # 	end  	
  # end
end
