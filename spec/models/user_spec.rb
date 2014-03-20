require "spec_helper"

describe User do
  context "when creating a user" do
    it "it creates a valid user" do
      expect{
      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
    	}.to change(User, :count).by(1)
    end

    it "it will not create a user with an invalid email" do
    	expect{
      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance", password: "password", password_confirmation: "password")
    	}.to change(User, :count).by(0)
  	end

  	it "it will not create a user with a non-unique email" do
  		expect{
  			User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
  			User.create(first_name: "Luke", last_name: "Skywalker", user_name: "i_kissed_my_sister", email: "han@alliance.com", password: "password", password_confirmation: "password")
  		}.to change(User, :count).by(1)
  	end
  end
end