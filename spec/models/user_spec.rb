require "spec_helper"

describe User do
  context "when displaying the user's first name" do
    it "is a combination of first and last name" do
      user = User.new(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@aliance.com", encrypted_password: "password")
      expect(user.first_name).to eq("Han")

      puts "test"
    end
  end
end

