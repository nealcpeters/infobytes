describe HomeController do
  describe "Index route" do
    it "must render index view'" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "About route" do
    it "must render about view'" do
      get :about
      expect(response).to render_template("about")
    end
  end
end