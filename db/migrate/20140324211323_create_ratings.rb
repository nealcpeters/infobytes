class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.integer :user_id
    	t.integer :tutorial_id
      t.integer :score
    end

    add_index :ratings, :user_id
    add_index :ratings, :tutorial_id
  end
end
