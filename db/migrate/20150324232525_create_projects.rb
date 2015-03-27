class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :company, null: false
      t.text :brief_description, null: false
      t.string :website_type, null: false
      t.string :role, null: false
      t.text :challenge, null: false
      t.string :website
      t.integer :order, default: 1

      t.timestamps null: false
    end
  end
end
