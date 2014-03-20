class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image_path

      t.timestamps
    end
  end
end
