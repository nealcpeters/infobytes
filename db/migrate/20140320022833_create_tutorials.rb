class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.belongs_to :user
      t.belongs_to :subtopic

      t.timestamps
    end

    add_index :tutorials, :user_id
    add_index :tutorials, :subtopic_id
  end
end
