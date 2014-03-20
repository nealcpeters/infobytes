class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :subtopic

      t.timestamps
    end
  end
end
