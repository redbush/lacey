class AddAttachmentCompanyImageToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :company_image
    end
  end

  def self.down
    remove_attachment :projects, :company_image
  end
end
