describe ImagesController do
  include Devise::TestHelpers

  before :each do
    @user = create(:user)
    sign_in @user
    tutorial_create
    chapter_create
    sub_chapter_create
    @image = Image.create(image_path_file_name: "test.jpg", image_path_content_type: "image/jpeg", image_path_file_size: 6851)    
    @content = Content.create(order_number: 1, attachable_id: @image.id, attachable_type: "Image", sub_chapter_id: @sub_chapter.id)
  end

  describe "new route" do
    it "must render new view" do
      get 'new', :sub_chapter_id => @sub_chapter.id
      expect(response).to render_template("new")
    end
  end

  describe "edit route" do
    it "must render edit route" do
      post 'edit', :id => @image.id
      expect(response).to render_template("edit")
    end
  end

  describe "update route" do
    it "must redirect to sub chapter if saved" do
      post 'update', id: @image.id, image: {image_path_file_name: "test9.jpg", image_path_content_type: "image/jpeg", image_path_file_size: 6853}
      expect(response).to render_template(@subchapter)
    end

    it "must render new view if save not successful" do
      post 'update', id: @image.id, image: {image_path_content_type: "image/jpeg", image_path_file_size: 6853}
      expect(response).to render_template(nil)
    end

  end

  describe "create route" do
    it "must redirect to subchapter if new image successful" do
      post 'create', sub_chapter_id: @sub_chapter.id, image: {image_path_file_name: "test2.jpg", image_path_content_type: "image/jpeg", image_path_file_size: 6851} 
      expect(response).to render_template("new")
    end

    it "must render new if creation is not successful" do
      post 'create', sub_chapter_id: @sub_chapter.id, image: {image_path_content_type: "image/jpeg", image_path_file_size: 6851} 
      expect(response).to render_template("new")
    end
  end

  describe "show route" do
    it "must render show route" do
      get :show, id: @image.id
      expect(response).to render_template("show")
    end
  end

  describe "destroy route" do
    it "must route to destroy" do
      {delete: "/images/#{@image.id}"}.should route_to(
        action: 'destroy',
        controller: 'images',
        id: (@image.id.to_s)
        )
    end
  end
end