describe CodeSnippetsController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
    chapter_create
    sub_chapter_create
    @code_snippet = CodeSnippet.create(body: "def show\r\n  puts \"hi\"\r\nend", language: "ruby")
    @content = Content.create(order_number: 1, attachable_id: @code_snippet.id, attachable_type: "CodeSnippet", sub_chapter_id: @sub_chapter.id)
  end

  describe "new route" do
    it "should render new code snippet form" do
      get 'new', :sub_chapter_id => @sub_chapter.id
      expect(response).to render_template("new")
    end
  end

  describe "edit route" do
    it "should render update code snippet form" do
      post 'edit', :id => @code_snippet.id
      expect(response).to render_template("edit")
    end
  end

  describe "update route" do
    it "must redirect to sub chapter if saved" do
      post 'update', id: @code_snippet.id, code_snippet: {body: "def show\r\n  puts \"hi\"\r\nend", language: "ruby"}
      expect(response).to render_template(@subchapter)
    end

    it "must render new view if save not successful" do
      post 'update', id: @code_snippet.id, code_snippet: {language: "ruby"}
      expect(response).to render_template(nil)
    end
  end

  describe "show route" do
    it "should render show form" do
      get 'show', id: @code_snippet.id
      expect(response).to render_template("show")
    end
  end

  describe "destroy route" do
    it "must route to destroy" do
      {delete: "/code_snippets/#{@code_snippet.id}"}.should route_to(
        action: 'destroy',
        controller: "code_snippets",
        id: (@code_snippet.id.to_s)
        )
    end

    it "must destroy a code snippet given proper params" do
      expect{
        delete :destroy, id: @code_snippet.id
      }.to change(CodeSnippet, :count).by(-1)
    end
  end

  describe "create route" do
    it "should redirect to sub chapter if saved" do
      post 'create', id: @code_snippet.id, code_snippet: {body: "def show\r\n  puts \"hi\"\r\nend", language: "ruby"}
      expect(response).to render_template(@subchapter)      
    end
    
    it "must redirect to new view if without a save" do
      post 'create', id: @code_snippet.id, code_snippet: {language: "ruby"}
      expect(response).to render_template('new')      
    end

  end

end