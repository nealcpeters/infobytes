require 'spec_helper'

describe Subtopic do
    context "when creating a subtopic" do
    it "it creates a valid subtopic" do
      expect{
      	Topic.create(title: "Movies").subtopics.create(title: "Star Wars", description: "Tutorials Relating to the Epic Heptology")
    	}.to change(Subtopic, :count).by(1)
    end
   end
end
