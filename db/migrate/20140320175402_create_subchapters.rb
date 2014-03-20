class CreateSubchapters < ActiveRecord::Migration
  def change
    create_table :subchapters do |t|
      t.string :title
      t.belongs_to :chapter

      t.timestamps
    end
  end
end
