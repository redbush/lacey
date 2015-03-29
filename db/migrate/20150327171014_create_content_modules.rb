class CreateContentModules < ActiveRecord::Migration
  def change
    create_table :content_modules do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :order, default: 1

      t.timestamps null: false
    end

    add_reference :content_modules, :project, index: true, null: false
  end
end
