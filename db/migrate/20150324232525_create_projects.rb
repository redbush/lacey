class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :company, null: false

      t.timestamps null: false
    end
  end
end
