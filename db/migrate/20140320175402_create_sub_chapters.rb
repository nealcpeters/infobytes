class CreateSubChapters < ActiveRecord::Migration
  def change
    create_table :sub_chapters do |t|
      t.string :title
      t.belongs_to :chapter

      t.timestamps
    end
  end
end
