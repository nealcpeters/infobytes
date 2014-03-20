class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :title
      t.text :description
      t.belongs_to :topic
      
      t.timestamps
    end
  end
end
