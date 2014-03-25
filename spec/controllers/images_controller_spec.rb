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
end