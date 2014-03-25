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
  		get 'edit', id: @paragraph.id
  		expect(response).to render_template("edit")
  	end
  end

  describe "update route" do
  	it "must redirect to sub chapter if creation successful" do
  		get 'update', id: @paragraph.id, paragraph: {body: "test paragraph"}
  		expect(response).to render_template('update')
  	end
  end

  # describe "Show route" do
  #   it "must render show view" do
  #     get 'show', :id => @tutorial.id
  #     expect(response).to render_template("show")
  #   end
  # end

end