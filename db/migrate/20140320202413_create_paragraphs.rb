 class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :body
      t.timestamps
    end
  end
end
