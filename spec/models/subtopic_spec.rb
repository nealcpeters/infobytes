require 'spec_helper'

describe Subtopic do
    context "when creating a subtopic" do
    it "it creates a valid subtopic" do
      expect{
      	Topic.create(title: "Movies").subtopics.create(title: "Star Wars", description: "Tutorials Relating to the Epic Heptology")
    	}.to change(Subtopic, :count).by(1)
    end
    it "it does not create a subtopic without a title" do
      expect{
      	Topic.create(title: "Movies").subtopics.create(description: "Tutorials Relating to the Epic Heptology")
    	}.to change(Subtopic, :count).by(0)
   end
   it "it does not create a subtopic without a description" do
      expect{
      	Topic.create(title: "Movies").subtopics.create(title: "Star Wars")
    	}.to change(Subtopic, :count).by(0)
    end
   end
end
