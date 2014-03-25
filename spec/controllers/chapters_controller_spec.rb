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
    

    it "must redirects if save'" do
      post :create, tutorial_id: @tutorial.id, chapter: {title: "tuttut", number: 42} 
      expect(response).to render_template(nil)
    end

    xit "must create a tutorial if saved" do
      expect{
        post :create, tutorial: {title: "tuttut", number: 42, user_id: @user.id, tutorial_id: @tutorial.id}
      }.to change(Tutorial, :count).by(1) 
    end
  end

  describe "Edit route" do
    xit "must render edit view if not AJAX'" do
      get :edit, id: @chapter.id
      expect(response).to render_template("edit")
    end
  end

  describe "Update route" do
    xit "must render edit view if it does not save'" do
      patch :update, id: @chapter.id, tutorial: {id: @chapter.id, description: nil}
      expect(response).to render_template("edit")
    end

    xit "must redirect to @tutorial upon save'" do
      patch :update, id: @tutorial.id, tutorial: {id: @tutorial.id, description: "blah"}
      expect(response).to redirect_to(@tutorial) 
    end
  end

  describe "Destroy route" do
    xit "must route to tutorials#destroy'" do
      {delete: "/tutorials/#{@tutorial.id}"}.should route_to(
        action: 'destroy',
        controller: "tutorials",
        id: (@tutorial.id.to_s)
      )
    end

    xit "must destroy a record given proper params'" do
      expect{
        delete :destroy, id: @tutorial.id
      }.to change(Tutorial, :count).by(-1)     
    end
  end
  
  describe "Index route" do
    xit "must render index view'" do
      get :index, page: 1
      expect(response).to render_template("index")
    end
  end

  describe "HTML_view route" do
    xit "must render html_view view'" do
      chapter_create
      get 'html_view', id: @tutorial.id
      expect(response).to render_template("html_view")
    end
  end

  describe "search route" do
    xit "must render search view'" do
      get :search, :params => {search_data: @tutorial.title}
      expect(response).to render_template("search")
    end
  end

end