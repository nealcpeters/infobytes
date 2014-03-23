class TutorialPdf < Prawn::Document
  require "open-uri"

  def initialize(tutorial)
    super()
    chapters = tutorial.chapters
    author = tutorial.user
    
    move_down(10)
    font_size(35) {text tutorial.title}
    move_down(10)
    font_size(15) {text tutorial.description}
    move_down(8)
    font_size(13) {text "written by: #{author.user_name}"}
    move_down(20)

    font_size(20) {text "Table of Contents"}
    move_down(10)

    chapters.each_with_index do |chapter, index|
      
      indent(20) do 
        font_size(15) {text "Section #{index + 1} - #{chapter.title}"}
        move_down(10)

        chapter.sub_chapters.each_with_index do |sub_chapter, sub_index|
	        indent(20) do
            font_size(12) {text "Sub-section #{index + 1}.#{sub_index + 1} - #{sub_chapter.title}"}
            move_down(10)
          end
        end

      end
    end
    move_down(20)

    chapters.each_with_index do |chapter, index|
    
      font_size(20) {text "Section #{index + 1} - #{chapter.title}"}
      move_down(10)

      chapter.sub_chapters.each_with_index do |sub_chapter, sub_index|
        font_size(15) {text "Sub-section #{index + 1}.#{sub_index + 1} - #{sub_chapter.title}"}
        move_down(10)

        sub_chapter.contents.each_with_index do |content, index| 
          attachment = content.attachable

          case content.attachable_type
          when "Paragraph"
            text attachment.body
            move_down(8)
          when "CodeSnippet"
            font_size(30) {text "Snippet"}
            move_down(8)
          when "Image"
          	font_size(30) {text "Image"}
          	if env_production?
	          	image open attachment.image_path.url(:original, false), scale: 0.9
	          else
	          	image "#{Rails.root}/public/#{attachment.image_path.url(:original, false)}", scale: 0.9
	          end
            move_down(8)
          end
        end

        move_down(10)
      end
    end
  end

  private

  def env_production?
    Rails.env.production?
  end
end























