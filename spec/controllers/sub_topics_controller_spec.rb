describe SubtopicsController do
  describe "Show route" do
    it "must render show view'" do
      @topic = Topic.create(title:"woot")
      @sub = Subtopic.create(title: "fun", topic_id: @topic.id, description: "tihs is here")
      @sub.tutorials.create(title: "test", description: "tihs is here")
      get :show, page: 1, id: @sub.id
      expect(response).to render_template("show")
    end
  end
end