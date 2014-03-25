require 'spec_helper'

describe ChaptersController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
    chapter_create
  end

  describe "Show route" do
    it "must render show view" do
      get 'show', :id => @chapter.id
      expect(response).to render_template("show")
    end
  end

  describe "New route" do
    it "must render new view'" do
      get :new, tutorial_id: @tutorial.id
      expect(response).to render_template("new")
    end
  end

  describe "Create route" do
    
    it "must redirects if save" do
      post :create, tutorial_id: @tutorial.id, chapter: {title: "tuttut", number: 42} 
      expect(response).to render_template(nil)
    end

    it "must create a chapter if saved" do
      expect{
      post :create, tutorial_id: @tutorial.id, chapter: {title: "tuttut", number: 42} 
      }.to change(Chapter, :count).by(1) 
    end
  end

  describe "Edit route" do
    it "must render edit view if not AJAX'" do
      get :edit, id: @chapter.id
      expect(response).to render_template("edit")
    end
  end

  describe "Update route" do
    it "must redirect to @tutorial upon save'" do
      patch :update, id: @chapter.id, chapter: {number: 1}
      expect(response).to redirect_to(@chapter) 
    end
  end

  describe "Destroy route" do
    it "must route to chapter#destroy'" do
      {delete: "/chapters/#{@chapter.id}"}.should route_to(
        action: 'destroy',
        controller: "chapters",
        id: (@chapter.id.to_s)
      )
    end

    it "must destroy a record given proper params'" do
      expect{
        delete :destroy, id: @chapter.id
      }.to change(Chapter, :count).by(-1)     
    end
  end

  describe "Generate route" do
    it "must render html_view view'" do
      post 'generate', tutorial_id: @tutorial.id
      expect(response).to redirect_to(@tutorial)
    end
  end

end