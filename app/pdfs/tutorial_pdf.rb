class TutorialPdf < Prawn::Document
  
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
          
          case content.attachable_type
          when "Paragraph"

          when "Code_Snippet"

          when "Image"
          end

        end
      end
    end
  end
end























