require 'spec_helper'

describe SubChaptersController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
    chapter_create
    sub_chapter_create
  end

  describe "Show route" do
    it "must render show view" do
      get 'show', :id => @sub_chapter.id
      expect(response).to render_template("show")
    end
  end

  describe "New route" do
    it "must render new view'" do
      get :new, chapter_id: @chapter.id
      expect(response).to render_template("new")
    end
  end

  describe "Create route" do
    
    it "must redirect if save" do
      post :create, chapter_id: @chapter.id, sub_chapter: {title: "tuttut", number: 42} 
      expect(response).to redirect_to(@chapter.sub_chapters.last)
    end

    it "must render new if no save" do
      post :create, chapter_id: @chapter.id, sub_chapter: {title: nil, number: 42} 
      expect(response).to render_template("new")
    end    

    it "will not save a record without a title" do
      expect{
        post :create, chapter_id: @chapter.id, sub_chapter: {number: 42} 
        }.to change(SubChapter, :count).by(0) 
    end

    it "must create a sub_chapter if saved" do
      expect{
        post :create, chapter_id: @chapter.id, sub_chapter: {title: "tuttut", number: 42} 
      }.to change(SubChapter, :count).by(1) 
    end
    
    # it "must redirect if save and json request" do      
    #   json = {chapter_id: @chapter.id, sub_chapter: {title: "tuttut", number: 42} }
    #   post :create, json
    #   response.status.should eq(302)
    # end
  end

  describe "Edit route" do
    it "must render edit view if not AJAX'" do
      get :edit, id: @sub_chapter.id
      expect(response).to render_template("edit")
    end
  end

  describe "Update route" do
    it "must redirect to @sub_chapter upon save'" do
      patch :update, id: @sub_chapter.id, sub_chapter: {number: 1}
      expect(response).to redirect_to(@sub_chapter) 
    end

    it "must render edit if no save'" do
      patch :update, id: @sub_chapter.id, sub_chapter: {title: nil}
      expect(response).to render_template("edit") 
    end

    # xit "must render json upon save if xhr'" do
    #   (@sub_chapter.number = 1).to_json
    #   @sub_chapter.save
    #   json = {id: @sub_chapter.id, sub_chapter: {number: 1}}
    #   request.env["HTTP_ACCEPT"] = 'application/json'      
    #   patch :update, json, format: :json
    #   parsed = JSON.parse(response.body)
    #   expect(parsed.test).to eq("@sub_chapter")
    # end
  end

  describe "Destroy route" do
    it "must route to sub_chapter#destroy'" do
      {delete: "/sub_chapters/#{@sub_chapter.id}"}.should route_to(
        action: 'destroy',
        controller: "sub_chapters",
        id: (@sub_chapter.id.to_s)
      )
    end

    # xit "must destroy a record given proper json params'" do
    #   json = {id: @sub_chapter.id}
    #   expect{
    #     delete :destroy, json
    #   }.to change(SubChapter, :count).by(-1)     
    # end
  end


end