class CreateSiteProperties < ActiveRecord::Migration
  def change
    create_table :site_properties do |t|
      t.string :key, null: false
      t.text :value, null: false

      t.timestamps null: false
    end

    add_index :site_properties, :key, unique: true
  end
end
