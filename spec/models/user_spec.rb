require "spec_helper"

describe User do
  context "when creating a user" do
    it "creates a valid user" do
      expect{
      	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
    	}.to change(User, :count).by(1)
    end

   #  it "will not create a user with an invalid email" do
   #  	expect{
   #    	User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance", password: "password", password_confirmation: "password")
   #  	}.to change(User, :count).by(0)
  	# end

    it { should_not allow_value('han@alliance').for(:email)}

    it "will not create a user with an invalid user name" do
      expect {
        User.create(user_name: nil, email: "han@alliance", password: "password", password_confirmation: "password")
      }.to change(User, :count).by(0)
    end

  	it "will not create a user with a non-unique email" do
  		expect{
  			User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
  			User.create(first_name: "Luke", last_name: "Skywalker", user_name: "i_kissed_my_sister", email: "han@alliance.com", password: "password", password_confirmation: "password")
  		}.to change(User, :count).by(1)
  	end

    it "will not create a user with a non-unique user name" do
      expect{
        User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@alliance.com", password: "password", password_confirmation: "password")
        User.create(first_name: "Luke", last_name: "Skywalker", user_name: "rebel_scum", email: "luke@alliance.com", password: "password", password_confirmation: "password")
      }.to change(User, :count).by(1)
    end

    it "will not create a user with a user name longer than 32 characters" do
      expect{
        User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scumxxxxxxxxxxxxxxxxxxxxxxx", email: "han@alliance.com", password: "password", password_confirmation: "password")
      }.to change(User, :count).by(0)
    end

    it "will not create a user name with characters other than alphanumeric and underscores" do
      expect{
        User.create(first_name: "Han", last_name: "Solo", user_name: "*rebel_scum*", email: "han@alliance.com", password: "password", password_confirmation: "password")
      }.to change(User, :count).by(0)
    end
  end
end