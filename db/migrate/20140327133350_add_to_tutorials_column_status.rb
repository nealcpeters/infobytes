class AddToTutorialsColumnStatus < ActiveRecord::Migration
  def change
    add_column :tutorials, :status, :boolean, default: false
  end
end
