class CreateSubChapters < ActiveRecord::Migration
  def change
    create_table :sub_chapters do |t|
      t.string :title
      t.belongs_to :chapter

      t.timestamps
    end

    add_index :sub_chapters, :chapter_id
  end
end
