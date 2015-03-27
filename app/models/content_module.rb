class ContentModule < ActiveRecord::Base
  validates_presence_of :title, :description

  def project_id_enum
    Project.pluck(:company, :id)
  end
end
