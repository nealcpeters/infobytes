describe ParagraphsController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
    chapter_create
    sub_chapter_create
    @paragraph = Paragraph.create(body: "test paragraph")
    @content = Content.create(order_number: 1, attachable_id: @paragraph.id, attachable_type: "Paragraph", sub_chapter_id: @sub_chapter.id)
  end

  describe "new route" do
  	it "must render new view" do
  		get 'new', sub_chapter_id: @sub_chapter.id
  		expect(response).to render_template("new")
  	end
  end

  describe "edit route" do
  	it "must render edit route" do
  		post 'edit', id: @paragraph.id
  		expect(response).to render_template("edit")
  	end
  end

  describe "update route" do
  	it "must redirect to sub chapter if creation successful" do
  		post 'update', id: @paragraph.id, paragraph: {body: "test paragraph"}
  		expect(response).to render_template(@subchapter)
  	end

    it "must render new if save failed" do
      post 'update', id: @paragraph.id, paragraph: {body: 1}
      expect(response).to render_template(nil)
    end
  end

  describe "create route" do
    it "must redirect to sub chapter if save successful" do
      post 'create', sub_chapter_id: @sub_chapter.id, paragraph: {body: "test paragraph"}
      expect(response).to render_template(@subchapter)
    end

    it "must render new if save unsuccessful" do
      post 'create', sub_chapter_id: @sub_chapter.id, paragraph: {body: 1}
      expect(response).to render_template(nil)
    end
  end

  describe "destroy route" do
    it "must route to destroy" do
      {delete: "/paragraphs/#{@paragraph.id}"}.should route_to(
        action: 'destroy',
        controller: "paragraphs",
        id: (@paragraph.id.to_s)
      )
    end

    it "must destroy a record given proper params" do
      expect{
        delete :destroy, id: @paragraph.id
      }.to change(Paragraph, :count).by(-1)
    end
  end

end