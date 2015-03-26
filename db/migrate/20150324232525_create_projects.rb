class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :company, null: false
      t.text :brief_description, null: false
      t.text :tag_line, null: false
      t.integer :order, default: 1

      t.timestamps null: false
    end
  end
end
