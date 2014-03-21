class CreateCodeSnippets < ActiveRecord::Migration
  def change
    create_table :code_snippets do |t|
    	t.text :body
      t.string :language
    	t.timestamps
    end
  end
end
