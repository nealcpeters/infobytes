require 'spec_helper'

# describe Topic do
#   context "when creating a topic" do
#     it "it creates a valid topic" do
#       expect{
#       	Topic.create(title: "Movies")
#     	}.to change(Topic, :count).by(1)
#     end
#    end
# end

# describe Topic do
# 	context "when creating a topic" do
# 	  it "creates topic when attributes valid" do
# 	    topic = FactoryGirl.build(:topic)
# 	    topic.should be_valid
# 	  end

# 	  it "does not create topic when invalid" do
# 	    topic = FactoryGirl.build(:topic, title: "")
# 	    topic.should_not be_valid
# 	  end
# 	end
# end

describe Topic do
	it { should validate_presence_of(:title) }
end