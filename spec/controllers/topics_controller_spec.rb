describe TopicsController do
  include Devise::TestHelpers
  describe "Index route" do
    it "must render index view'" do
      get :index, page: 1
      expect(response).to render_template("index")
    end
  end

  describe "Show route" do
    it "must render show view'" do
      @topic = Topic.create(title:"woot")
      get :show, page: 1, id: @topic.id
      expect(response).to render_template("show")
    end
  end
end