class CreateContentModules < ActiveRecord::Migration
  def change
    create_table :content_modules do |t|
      t.references :project, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
