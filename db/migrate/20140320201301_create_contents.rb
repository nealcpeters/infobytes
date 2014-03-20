class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :order_number
      t.references :attatchable, polymorphic: true
      t.belongs_to :sub_chapter

      t.timestamps
    end
  end
end
