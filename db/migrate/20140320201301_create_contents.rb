class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :order_number
      t.references :attachable, polymorphic: true
      t.belongs_to :sub_chapter

      t.timestamps
    end

    add_index :contents, :sub_chapter_id
  end
end
