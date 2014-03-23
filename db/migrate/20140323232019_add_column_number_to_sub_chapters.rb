class AddColumnNumberToSubChapters < ActiveRecord::Migration
  def change
    add_column :sub_chapters, :number, :integer, default: 0
  end
end
