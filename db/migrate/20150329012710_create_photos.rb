class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :photo
      t.integer :order, default: 1

      t.timestamps null: false
    end

    add_reference :photos, :content_module, index: true, null: false
  end
end
