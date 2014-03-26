describe TutorialsController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
  end

  describe "Show route" do
    it "must render show view" do
      get 'show', :id => @tutorial.id
      expect(response).to render_template("show")
    end

  end

  describe "New route" do
    it "must render new view'" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "Create route" do
    it "must render new view if without a save'" do
      post :create, tutorial: {id: @tutorial.id, description: @tutorial.description, user_id: @user.id}
      expect(response).to render_template("new")
    end

    it "must redirects if save'" do
      post :create, tutorial: {title: "tuttut", description: "basd", user_id: @user.id}
      expect(response).to render_template(nil)
    end

    it "must save a tutorial if proper params" do
      expect{
        post 'create', tutorial: {id: @tutorial.id, title: "tuttttorial", description: "woohoo"}
      }.to change(Tutorial, :count).by(1) 
    end

    it "must not sae a tutorial if saved" do
      expect{
        post 'create', tutorial: {id: @tutorial.id, description: "woohoo"}
      }.to change(Tutorial, :count).by(0) 
    end
  end

  describe "Edit route" do
    it "must render edit view if not AJAX'" do
      get :edit, id: @tutorial.id
      expect(response).to render_template("edit")
    end

    it "must render edit view if not AJAX'" do
      sign_out @user
      get :edit, id: @tutorial.id
      expect(response).to redirect_to("/")
    end
  end

  describe "Update route" do
    it "must render edit view if it does not save'" do
      patch :update, id: @tutorial.id, tutorial: {id: @tutorial.id, description: nil}
      expect(response).to render_template("edit")
    end

    it "must redirect to @tutorial upon save'" do
      patch :update, id: @tutorial.id, tutorial: {id: @tutorial.id, description: "blah"}
      expect(response).to redirect_to(@tutorial) 
    end
  end

  describe "Destroy route" do
    it "must route to tutorials#destroy'" do
      {delete: "/tutorials/#{@tutorial.id}"}.should route_to(
        action: 'destroy',
        controller: "tutorials",
        id: (@tutorial.id.to_s)
      )
    end

    it "must destroy a record given proper params'" do
      expect{
        delete :destroy, id: @tutorial.id
      }.to change(Tutorial, :count).by(-1)     
    end
  end
  
  describe "Index route" do
    it "must render index view'" do
      get :index, page: 1
      expect(response).to render_template("index")
    end
  end

  describe "HTML_view route" do
    it "must render html_view view'" do
      chapter_create
      get 'html_view', id: @tutorial.id
      expect(response).to render_template("html_view")
    end
  end

  describe "Search route" do
    it "must render search view'" do
      get :search, :params => {search_data: @tutorial.title}
      expect(response).to render_template("search")
    end
  end

  # describe "Add Commuity route" do
  #   it "must catch a bad tutorial'" do
  #     @com = Community.create(name: "a", description: "blah")
  #     patch :add_community, id: @tutorial.id, tutorial: {title: nil, community_id: @com.id}
  #     expect(response).to redirect_to(@tutorial)
  #   end
  # end

end