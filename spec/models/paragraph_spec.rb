require 'spec_helper'

describe Paragraph do
  context "when creating a paragraph" do
    it "is succesfull when a body is provided" do
      expect{
        Paragraph.create(body: "some paragraph")
      }.to change(Paragraph, :count).by(1)
    end

    it "fails without content in the body" do
      expect{
        Paragraph.create
      }.to change(Paragraph, :count).by(0)
    end
   end
end