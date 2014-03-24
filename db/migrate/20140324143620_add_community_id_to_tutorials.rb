class AddCommunityIdToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :community_id, :integer
  end
end
