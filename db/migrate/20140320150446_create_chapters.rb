class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :number
      t.belongs_to :tutorial

      t.timestamps
    end
  end
end
