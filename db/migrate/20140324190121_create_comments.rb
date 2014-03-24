class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :content
      t.belongs_to :user, default: 0
      t.text :body
      t.timestamps
    end
  end
end
