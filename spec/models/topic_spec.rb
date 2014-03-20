require 'spec_helper'

describe Topic do
  context "when creating a topic" do
    it "it creates a valid topic" do
      expect{
      	Topic.create(title: "Movies")
    	}.to change(Topic, :count).by(1)
    end
   end
end
