class CreateCommunitiesUsers < ActiveRecord::Migration
  def change
  	create_table :communities_users do |t|
      t.belongs_to :user
      t.belongs_to :community
    end
  end
end
