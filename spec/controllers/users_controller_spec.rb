describe UsersController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "Show route" do
    it "must render show view" do
      get 'show', :id => @user.id
      expect(response).to render_template("show")
    end
  end

  describe "Sign in" do
    it "must render new view" do
      get 'sign_in'
      expect(response).to render_template("devise/sessions/_form")
    end
  end

  describe "Sign up" do
  	it "must render sign up" do
  		get 'sign_up'
  		expect(response).to render_template("devise/registrations/_form_new")
  	end
  end

  # describe "Create route" do
  #   it "must render new view if without a save'" do
  #     post :create, tutorial: {id: @tutorial.id, description: @tutorial.description, user_id: @user.id}
  #     expect(response).to render_template("new")
  #   end

  #   it "must redirects if save'" do
  #     post :create, tutorial: {title: "tuttut", description: "basd", user_id: @user.id}
  #     expect(response).to render_template(nil)
  #   end

  #   it "must create a tutorial if saved" do
  #     expect{
  #       post 'create', tutorial: {id: @tutorial.id, title: "tuttttorial", description: "woohoo"}
  #     }.to change(Tutorial, :count).by(1) 
  #   end
end  