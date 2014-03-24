class AddDescriptionToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :description, :string
  end
end
